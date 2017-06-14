CREATE OR REPLACE FORCE VIEW PIA_ADMIN.WEB_ENROLLERFORMPLANS_V
AS
   SELECT ID,
          OEID,
          Web.EMPLOYEEID,
          Web.Memberid,
          M.Lastname || ', ' || M.Firstname || ' ' || M.Middlename Membername,
          DECODE (M.Employeetype,
                  0, 'Employee',
                  1, 'Spouse',
                  2, 'Child',
                  'Domestic Partner')
             MemberType,
          DECODE (m.male, 'Y', 'Male', 'Female') Gender,
          web.PLANID,
          P.Planname,
          P.Plantypeid,
          P.Carrierid,
          Pt.Description planTypeName,
          EFFECTIVEDATE,
          PLANOFFICE1,
          PLANOFFICE2,
          INSURANCEAMOUNT,
          PLANOFFICE3,
          EXPIRYDATE,
          Web.MEMBERPLANID,
          Web.Treasonid
     FROM Web_Enrollerformplans Web
          LEFT JOIN Plans P ON Web.Planid = P.Planid
          LEFT JOIN Plantype Pt ON P.Plantypeid = Pt.Plantypeid
          LEFT JOIN Treason Tr ON Web.Treasonid = Tr.Treasonid
          LEFT JOIN MEMBER M ON Web.Memberid = M.Memberid;
