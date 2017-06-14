CREATE OR REPLACE FORCE VIEW WEB_INVOICESUMMARY_V
AS
   WITH firstCut
        AS (SELECT ih.*,
                   NVL ( (SELECT SUM (ac.chargeAmount)
                            FROM arCharges ac
                           WHERE ih.invoiceNbr = ac.invoiceNbr),
                        0)
                      otherChargeAmount
              FROM invoiceHeader ih
             WHERE invoiceDate > ADD_MONTHS (SYSDATE, -24))
   SELECT invoiceNbr,
          invoiceDate,
          employerId,
          dueDate,
          terms,
          denormAmt - otherChargeAmount totalAmountDue,
          otherChargeAmount,
          denormAmt totalInvoiceAmount
     FROM firstCut;