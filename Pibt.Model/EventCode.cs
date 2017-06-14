using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Pibt.Model
{
    public enum EventCode
    {
        AppError = 0,
        CreateWebAccount = 5,
        ChangePassword = 6,
        ChangeLoginName = 310,
        Login = 7,
        Logout = 8,
        MaintainWebSite = 9,
        SynAgentWebUserFromBMS = 10,
        SynRKWebUserFromBMS = 11,
        SynEmployerWebUserFromBMS = 12,
        SynMemberWebUserFromBMS = 13,
        ApproveEnrollment = 14,
        RejectEnrollment = 15,
        CancelEnrollment = 16,
        SubmitEnrollment = 17,
        CreateEnrollment = 18,
        ModifyEnrollment = 19,
        TerminateEnrollment = 20,
        SynBrokerWebUserFromBms = 21,
        SynEnrollerWebUserFromBms=22,

        UpdateAdmin = 101,
        UpdateAgent = 102,
        UpdateRK = 103,
        UpdateEmployer = 104,
        UpdateEmployee = 105,
        UpdateDependent = 106,
        UpdatePlan = 107,
        UpdateEmployerContact = 108,
        UpdateBroker = 109,
        UpdateEnroller=110,

        AddAdmin = 201,
        AddAgent = 202,
        AddRK = 203,
        AddEmployer = 204,
        AddEmployee = 205,
        AddDependent = 206,
        AddPlan = 207,
        AddEmployerContact = 208,
        AddEmployerDBA = 209,
        AddBroker = 210,
        AddEnroller=211,

        DeleteAdmin = 301,
        DeleteAgent = 302,
        DeleteRK = 303,
        DeleteEmployer = 304,
        DeleteEmployee = 305,
        DeleteDependent = 306,
        DeletePlan = 307,
        DeleteEmployerContact = 308,
        DeleteEmployerDBA = 309,
        //ChangeLoginName = 310,
        DeleteBroker = 311,
        DeleteEnroller=312
    }

}
