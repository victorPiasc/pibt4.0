using System;
using System.Web;
using System.Web.Security;
using Pibt.Model;
using System.Security.Cryptography;
using System.Web.UI.WebControls;
using System.IO;
using System.Text.RegularExpressions;
using Microsoft.CSharp;
using Excel;
using System.Data;


namespace Pibt {
    public class SortaBasePage: System.Web.UI.Page {
        protected override void OnLoad(EventArgs e) {
            if (!Common.ApplicationConfiguration.IsTestServer)
                Page.ErrorPage = "/UhOh.aspx";
            base.OnLoad(e);
        }

        public static void oops(HttpContext current)
        {
            current.ClearError();
            current.Response.Redirect("/Oooops.aspx", true);
        }

        public void oops()
        {
            oops(HttpContext.Current);
        }

        public static void login(string username, string password, HttpContext context, System.Web.UI.Page page)
        {
            MembershipUser userInfo = Membership.GetUser(username);
            if (Membership.ValidateUser(username, password))
            {
                if (page.User.Identity.IsAuthenticated || context.Session != null)
                    context.Session.Clear();
                UserCacheInfo tmp = BLL.User.RefreshUserCacheInfo(username);
                if (BLL.User.hasValidTime((int)tmp.UserRole, username))
                {
                    BLL.User.UpdateWebUserLoginInfo(username, context.Request.UserHostAddress);
                    string redirectUrl = FormsAuthentication.GetRedirectUrl(username, false);
                    FormsAuthentication.SetAuthCookie(username, false);
                    BLL.Logger.WriteAuditLog(string.Format("{0} logged in", page.User.Identity.Name), EventCode.Login);
                    page.Response.Redirect("/acknowledgement.aspx?returnUrl=" + redirectUrl);
                    //NOTREACHED
                }
            }
        }

        public void login(string username, string password)
        {
            login(username, password, HttpContext.Current, Page);
        }

        public string generateCode()
        {
            string vCode = "";
            char[] chars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890".ToCharArray();
            byte[] key = new byte[7];
            RNGCryptoServiceProvider crypt = new RNGCryptoServiceProvider();
            crypt.GetNonZeroBytes(key); //fills in array with non zero values
            foreach (byte b in key)
            {
                vCode += chars[b % (chars.Length)];
            }
            return vCode;
        }

        public string uploadGeneric(FileUpload fu, string serverPath, int cartId, int familyId, BizInfoDetails user, bool forQQ)
        {
            return uploadGeneric(HttpContext.Current, fu, serverPath, cartId, familyId, user, forQQ);
        }

        public static string uploadGeneric(HttpContext context, FileUpload fu, string serverPath, int cartId, int familyId, BizInfoDetails user, bool forQQ)
        {
            string message = "";
            if (fu.HasFile)
            {
                System.IO.FileInfo fi = new System.IO.FileInfo(fu.FileName);
                switch (fi.Extension.ToUpper())
                {
                    case ".CSV":
                    case ".TXT":
                    case ".TSV":
                        message = upload(fu, cartId, familyId);
                        break;
                    case ".XLSX":
                    case ".XLS":
                        if (!forQQ)
                            BLL.Employee.deleteAllMembers(user.EmployerId);
                        message = uploadExcel(context, fu, serverPath, forQQ, user, cartId, familyId);
                        break;
                    default:
                        message = "File not accepted.";
                        break;
                }
            }
            else
                message = "No file found";
            return message;
        }

        public static string uploadExcel(HttpContext current, FileUpload fu, string serverPath, bool forQQ, BizInfoDetails user, int cartId, int familyId)
        {
            string message = "",employeeId="", type, gender, first="";
            bool insert;
            int age, emptycount = 0, length = forQQ ? 5 : 9;
            DateTime bday;
            DateTime? marriageDate = null;
            string filePath = current.Server.MapPath(serverPath + fu.PostedFile.FileName);
            fu.SaveAs(filePath);
            FileStream stream = File.Open(filePath, FileMode.Open, FileAccess.Read);
            IExcelDataReader excelReader = ExcelReaderFactory.CreateOpenXmlReader(stream);
            DataSet results = excelReader.AsDataSet();
            DataTable data = results.Tables[0];
            DataRow row;
            string[] args = new string[length];
            for(int i = 0; i < data.Rows.Count; i++)
            {
                emptycount = 0;
                emptyArgs(args);
                row = data.Rows[i];

                if (row.ItemArray.Length < length)
                {
                    message = "Incorrect format";
                    break;
                }

                for (int j = 0; j < length; j++)
                {
                    args[j] = row.ItemArray[j] == DBNull.Value ? "" : row.ItemArray[j].ToString();
                    if (row.ItemArray[j] == DBNull.Value)
                        emptycount++;
                }

                first = args[0].ToUpper();
                if (emptycount == length || first.Contains("LAST") || args[0].Contains("(*)") || first.Contains("COMPANY") || args[2].ToUpper().Contains("FOR QUESTIONS"))
                    continue;

                args[0] = isEmpty(args[0], "lastName_" + i);
                args[1] = isEmpty(args[1], "person_" + i);
                args[2] = isEmpty(args[2], "E");
                args[3] = isEmpty(args[3], "M");

                args[2].ToUpper();
                switch(args[2][0])
                {
                    case 'C':
                        type="2";
                        break;
                    case 'S':
                        type="1";
                        break;
                    case 'D':
                        type = "3";
                        break;
                    default:
                        type="0";
                        break;
                }

                bday = !string.IsNullOrEmpty(args[4])
                    ? DateTime.TryParse(args[4], out bday)
                        ? bday
                        : DateTime.FromOADate(double.Parse(args[4]))
                    : DateTime.Now.AddYears(args[2] == "C"
                        ? -12
                        : -32);
                age = checkAge(bday);

                if (type == "2" && checkAge(bday) >= 260000)
                {
                    message += args[1] + " " + args[0] + " was not added due to being overaged<br />";
                    continue;
                }

                if (age <= 0)
                {
                    message += args[1] + " " + args[2] + " was not added due to incorrect birthdate<br/>";
                    continue;
                }

                gender = args[3][0] == 'F' || args[3][0] == 'f' ? "N" : "Y";

                if (!forQQ) //set when it is not for QQ 
                {
                    if (type == "1")  //cannot us ternary because DateTime != DateTime? 
                        marriageDate = DateTime.Today;
                    else
                        marriageDate = null;
                    args[5] = args[5].Replace("-", "");
                }

                if (args[2][0] == 'E' || args[2][0] == 'e')
                    employeeId = BLL.Employer.GetNewMemberId();
                insert = !forQQ 
                    ? args[2][0] == 'E' || args[2][0] == 'e'
                            ? BLL.Employer.InsertMember(employeeId, employeeId, user.EmployerId, args[0].Trim(), args[1].Trim(), "", type, gender, args[5], bday, null /*marriageDate*/, DateTime.Today, null /*addressone*/, null /*addressTwo*/, null/*city*/, null/*state*/, user.PhsicalPostCode, null/*mobileNbr*/, null/*homeNbr*/, null/*workNbr*/, args[8],  "N", "0" /*maritalStatusId*/, null/*deptId*/,"ER"+user.EmployerId, "0", "0", args[7], args[6])
                            : BLL.Employer.InsertDependent(BLL.Employer.GetNewMemberId(), employeeId, user.EmployerId, args[0].Trim(), args[1].Trim(), "", type, gender, args[5], bday, marriageDate, null/*addressOne*/, null/*city*/, null/*state*/, user.PhsicalPostCode, null/*mobileNbr*/, null/*homeNbr*/, null/*workNbr*/, args[8], "N", null /*adoptionaDate*/, "ER"+user.EmployerId)
                     : BLL.OnlineQuote.InsertWebQQCart(cartId, args[0] + ", " + args[1], int.Parse(type), type == "0" 
                        ? "Employee" 
                        : type == "1" 
                            ? "Spouse/Domestic Partner" 
                            :  "Child", gender[0], bday,  type=="0"
                                ? ++familyId 
                                : familyId, null, null, null, null);
            }
            excelReader.Close();
            File.Delete(filePath);
            return message;
        }

        public static string isEmpty(string value, string replacement)
        {
            return string.IsNullOrEmpty(value)
                ? replacement 
                : Regex.Replace(value, @"[\d-]", string.Empty);
        }

        public static void emptyArgs(string[] args)
        {
            for (int i = 0; i < args.Length; i++)
                args[i] = "";
        }

        public static string upload(FileUpload fu, int cartId, int familyId)
        {
            //only allow csv, tsv, txt files 
            string missing = "", byChar = "", lastname = "";;
            StreamReader reader = new StreamReader(fu.PostedFile.InputStream);
            string[] result = new string[5];
            int columnNum, j = 0, typeNum, age;
            char male;
            bool isTsv, quoteOpen = false;
            DateTime dt;
            try
            {
                while (!reader.EndOfStream)
                {
                    j++;
                    string line = reader.ReadLine();
                    isTsv = hasChar(line, '\t');
                    if (Regex.IsMatch(line, @"\d"))
                    {
                        columnNum = 0;
                        byChar = "";
                        result[0] = result[1] = result[2] = result[3] = result[4] = "";
                        for (int i = 0; i < line.Length && string.IsNullOrEmpty(result[4]); i++)
                        {
                            switch (line[i])
                            {
                                case '"':
                                    if (quoteOpen && line[i + 1] == '"')
                                        byChar += '"';
                                    else
                                        quoteOpen = !quoteOpen;
                                    break;
                                case ',':
                                    if (quoteOpen || isTsv)
                                        byChar += ',';
                                    else
                                    {
                                        result[columnNum++] = byChar;
                                        byChar = "";
                                    }
                                    break;
                                case '\t':
                                    if (quoteOpen || !isTsv)
                                        byChar += ' ';
                                    else
                                    {
                                        result[columnNum++] = byChar;
                                        byChar = "";
                                    }
                                    break;
                                case '\r':
                                    break;
                                default:
                                    byChar += line[i];
                                    break;
                            }
                        }
                        if (columnNum < 5)
                            result[columnNum] = byChar;
                        if (result[0] == "" && result[1] == "" && result[2] == "" && result[3] == "" && result[4] == "")
                            continue;
                        result[0] = result[0] == "" ? lastname : result[0].Trim();
                        result[1] = result[1] == "" ? "person_" + j : result[1].Trim();
                        if (result[2] != "")
                        {
                            switch (result[2][0])
                            {
                                case 'S':
                                case 'D':
                                    result[2] = "Spouse/Domestic Partner";
                                    typeNum = 1;
                                    break;
                                case 'C':
                                    result[2] = "Child";
                                    typeNum = 2;
                                    break;
                                default:
                                    result[2] = "Employee";
                                    typeNum = 0;
                                    lastname = result[0];
                                    break;
                            }
                        }
                        else
                        {
                            result[2] = "Employee";
                            typeNum = 0;
                        }
                        male = (result[3] == "" || result[3][0] != 'F')
                                ? 'Y'
                                : 'N';
                        dt = DateTime.TryParse(result[4], out dt)
                                ? dt
                                : DateTime.Now.AddYears(typeNum < 2
                                    ? -32
                                    : -12);
                        age = checkAge(dt);
                        if (typeNum == 3 && age >= 260000)
                        {
                            missing += result[0] + " " + result[1] + " was not added due to being overaged<br />";
                            continue;
                        }
                        if (age <= 0)
                        {
                            missing += result[0] + " " + result[1] + " was not added due to incorrect birthdate<br/>";
                            continue;
                        }
                        BLL.OnlineQuote.InsertWebQQCart(cartId, result[0] + ", " + result[1], typeNum, result[2], male, dt, typeNum == 0 ? ++familyId : familyId, null, null, null, null);
                    }
                }
            }
            catch 
            {
                missing = "Could not read file";
            }

            return missing;
        }

        public static bool hasChar(string line, char j)
        {
            for (int i = 0; i < line.Length; i++)
                if (line[i] == j)
                    return true;
            return false;
        }

        public static int checkAge(DateTime? birthdate)
        {
            var today = DateTime.Today;
            DateTime DOB = DateTime.Parse(birthdate.ToString());

            var _today = (today.Year * 100 + today.Month) * 100 + today.Day;
            var _DOB = (DOB.Year * 100 + DOB.Month) * 100 + DOB.Day;
            int _age = (int)(_today - _DOB);

            return _age;
        }
    }
}