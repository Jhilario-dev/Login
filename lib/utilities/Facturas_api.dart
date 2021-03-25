class FacturasApi {
  String id;
  String status;
  String paymentEstatus;
  String invoiceNo;
  String transactionDate;
  String taxAmount;
  String discountAmount;
  String finalTotal;
  String contactId;


  FacturasApi(
      {this.id, 
      this.status, 
      this.paymentEstatus, 
      this.invoiceNo,
      this.transactionDate,
      this.taxAmount,
      this.discountAmount,
      this.finalTotal,
      this.contactId
      }
    );

  FacturasApi.fromJson(Map<String, dynamic> json) {
    id = json['id'].toString();
    status = json['status'];
    paymentEstatus = json['payment_status'];
    invoiceNo = json['invoice_no'];
    transactionDate = json['transaction_date'].toString();
    taxAmount = json['tax_amount'];
    discountAmount = json['discount_amount'];
    finalTotal = json['final_total'];
  	contactId = json['contact_id'].toString();

  }
}