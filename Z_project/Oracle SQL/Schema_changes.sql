--Last release to live was 20170517
CREATE INDEX id$deptId ON invoiceDetail(deptId);
CREATE INDEX me$deptId ON monthEnd(deptId);


CREATE SEQUENCE brokerAgentSEQ;

alter table web_qqEmployer
add brokerId number(6);