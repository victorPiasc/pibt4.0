CREATE OR REPLACE VIEW arPaymentTotal
AS
   SELECT employerId,
      TRUNC(receivedOn,'MM') paymentMonth,
      SUM(amount) paid
      FROM arPayment
      GROUP BY employerId, TRUNC(receivedOn,'MM');