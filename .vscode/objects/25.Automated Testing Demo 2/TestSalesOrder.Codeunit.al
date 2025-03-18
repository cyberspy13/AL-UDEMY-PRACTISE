codeunit 50305 "Test Codeunit 3"
{
    Subtype = Test;

    [Test]
    internal procedure CreateItem()
    begin
        Item.Init();
        Item."No." := '1115';
        ItemNumber := Item."No.";
        Item.Description := 'Test Item';
        Item.Type := Item.Type::"Inventory";
        Item."Base Unit of Measure" := 'PCS';
        Item."Unit Cost" := 10;
        Item."Unit Price" := 20;
        Item.Validate("Replenishment System", Item."Replenishment System"::"Prod. Order");

        Assert.IsTrue(Item.Insert(true), 'Item was not inserted.');
        Assert.IsTrue(Item.Get(Item."No."), 'Item was not found after insertion.');
        Assert.AreEqual('1115', Item."No.", 'Item was not created with the correct number.');
        Assert.AreEqual(Item."Replenishment System"::"Prod. Order", Item."Replenishment System",
                        'Item was not created with the correct replenishment system.');
    end;

    [Test]
    internal procedure CreateCustomer()
    begin
        Customer.Init();
        Customer."No." := 'C00060';
        CustomerNumber := Customer."No.";
        Customer.Name := 'Test Customer';
        Customer.Address := 'Test Address';
        Customer."Bill-to Customer No." := '10000';
        Customer."Gen. Bus. Posting Group" := 'DOMESTIC';
        Customer."VAT Bus. Posting Group" := 'DOMESTIC';
        Customer."Customer Posting Group" := 'DOMESTIC';

        Customer.Insert(true);

        Assert.IsTrue(Customer.Get(Customer."No."), 'Customer was not found after insertion.');
        Assert.AreEqual('C00060', Customer."No.", 'Customer was not created with the correct number.');
        Assert.AreEqual('Test Customer', Customer.Name, 'Customer was not created with the correct name.');
    end;

    [Test]
    internal procedure CreateSalesOrder();
    begin
        SalesAndRecSetup.Get();
        SalesOrder.Init();
        SalesOrder.Validate("Document Type", SalesOrder."Document Type"::Order);
        SalesOrder.InitInsert();
        SalesOrder.InitRecord();
        SalesOrder.Validate("Sell-to Customer No.", CustomerNumber);

        if SalesOrder."Sell-to Customer Name" <> 'Test Customer' then
            Error('Sales order was not created with the correct customer name. Expected: %1, found: %2',
                'Test Customer', SalesOrder."Sell-to Customer Name");
        if SalesOrder."Ship-to Address" <> 'Test Address' then
            Error('Sales order was not created with the correct address. Expected: %1, found: %2',
                'Test Address', SalesOrder."Ship-to Address");
        if SalesOrder."Bill-to Customer No." <> '10000' then
            Error('Sales order was not created with the correct bill-to customer number. Expected: %1, found: %2',
                '10000', SalesOrder."Bill-to Customer No.");

        IsInserted := SalesOrder.Insert(true);
        if not IsInserted then
            Error('Sales order was not inserted.');

        SalesOrderLine.Init();
        SalesOrderLine.Validate("Document Type", SalesOrderLine."Document Type"::Order);
        SalesOrderLine.Validate("Document No.", SalesOrder."No.");
        SalesOrderLine."Line No." := 10000;
        SalesOrderLine.Validate(Type, SalesOrderLine.Type::Item);
        SalesOrderLine."No." := ItemNumber;
        SalesOrderLine."Location Code" := 'MAIN';
        SalesOrderLine.Quantity := 1;

        Assert.IsTrue(SalesOrderLine.Insert(true), 'Sales order line was not inserted.');
        Assert.AreEqual(1, SalesOrderLine.Quantity, 'Sales order line was not created with the correct quantity.');
        Assert.AreEqual(ItemNumber, SalesOrderLine."No.", 'Sales order line was not created with the correct item number.');
        Assert.AreEqual('MAIN', SalesOrderLine."Location Code", 'Sales order line was not created with the correct location code.');




    end;

    var
        Item: Record Item;
        IsInserted: Boolean;
        Customer: Record Customer;
        Assert: Codeunit "Library Assert";
        ItemNumber: Code[20];
        CustomerNumber: Code[20];
        SalesOrderNumber: Code[20];
        NoSeries: Codeunit "No. Series";
        SalesAndRecSetup: record "Sales & Receivables Setup";
        SalesOrder: Record "Sales Header";
        SalesOrderLine: Record "Sales Line";


}