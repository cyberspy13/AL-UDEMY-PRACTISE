codeunit 50304 "Test Codeunit 2"
{
    Subtype = Test;

    [Test]
    procedure CheckSalesOrderCreation()
    var
        SalesOrder: Record "Sales Header";
        SalesOrderLine: Record "Sales Line";
        Customer: Record Customer;
        Item: record Item;
    begin
        Customer.Get('10000');
        SalesOrder.Init();
        SalesOrder."Document Type" := SalesOrder."Document Type"::Order;
        SalesOrder."Sell-to Customer No." := '10000';
        SalesOrder."Sell-to Customer Name" := Customer.Name;
        SalesOrder."Document Date" := TODAY;
        SalesOrder."Your Reference" := 'Test Sales Order ML';
        SalesOrder.Insert();

        Item.Get('1928-S');
        SalesOrderLine.Init();
        SalesOrderLine."Document Type" := SalesOrder."Document Type";
        SalesOrderLine."Document No." := SalesOrder."No.";
        SalesOrderLine."Line No." := 10000;
        SalesOrderLine.Type := SalesOrderLine.Type::Item;
        SalesOrderLine."No." := '1928-S';
        SalesOrderLine.Quantity := 10;
        SalesOrderLine."Unit Price" := 100;
        SalesOrderLine."Location Code" := 'MAIN';
        SalesOrderLine.Insert();

        if SalesOrder."Sell-to Customer Name" <> 'Adatum Corporation' then
            Error('Sales order was not created for the correct customer. Expected: %1, found: %2',
                'Adatum Corporation', SalesOrder."Sell-to Customer Name");

        if SalesOrderLine."No." <> '1928-S' then
            Error('Sales order line was not created for the correct item. Expected: %1, found: %2',
                '1928-S', SalesOrderLine."No.");
    end;

}