using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using Pibt.UserControl;
using Pibt.Model;
using Pibt.Common;

namespace Pibt.Employer
{
    public partial class EditMemberDetails : BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(EmployeeId) ||
                string.IsNullOrEmpty(EmployerId) ||
                string.IsNullOrEmpty(MemberId) ||
                CurrentUserInfo.UserRole == UserRoles.Dependent && EmployeeId == MemberId)
            {
                oops();
                return;
            }

            //set user control
            CtlEditMemberDetails1.EmployeeId = EmployeeId;
            CtlEditMemberDetails1.EmployerId = EmployerId;
            CtlEditMemberDetails1.MemberId = MemberId;
            CtlEditMemberDetails1.Role = CurrentUserInfo.UserRole;

            CtlCreateWebUser1.UserId = MemberId;
            CtlCreateWebUser1.Role = CtlChangePassword1.Role = (MemberId == EmployeeId) ? UserRoles.Employee : UserRoles.Dependent;
            CtlChangePassword1.Visible = !CtlCreateWebUser1.Visible;
            CtlChangePassword1.UserId = MemberId;
        }

        void CtlCreateWebUser1_OnCreateFinished(object sender, CreateWebUserEventArgs e)
        {
            CtlChangePassword1.Visible = true;
        }
    }
}