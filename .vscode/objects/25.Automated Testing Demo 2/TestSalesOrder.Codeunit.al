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
    internal procedure CreateVendor()
    begin
        Vendor.Init();
        Vendor."No." := '60000';
        VendorNumber := Vendor."No.";
        Vendor.Name := 'Test Vendor';
        Vendor.Address := 'Test Address';
        Vendor."Gen. Bus. Posting Group" := 'DOMESTIC';
        Vendor."VAT Bus. Posting Group" := 'DOMESTIC';
        Vendor."Vendor Posting Group" := 'DOMESTIC';

        Assert.IsTrue(Vendor.Insert(true), 'Vendor was not inserted.');
        Assert.IsTrue(Vendor.Get(Vendor."No."), 'Vendor was not found after insertion.');
        Assert.AreEqual('60000', Vendor."No.", 'Vendor was not created with the correct number.');
        Assert.AreEqual('Test Vendor', Vendor.Name, 'Vendor was not created with the correct name.');
        Assert.AreEqual('Test Address', Vendor.Address, 'Vendor was not created with the correct address.');
    end;

    [Test]
    internal procedure CreatePurchaseOrder()
    begin
        SalesAndRecSetup.Get();
        PurchaseOrder.Init();
        PurchaseOrder.Validate("Document Type", PurchaseOrder."Document Type"::Order);
        PurchaseOrder.InitInsert();
        PurchaseOrder.InitRecord();
        PurchaseOrder.Validate("Buy-from Vendor No.", VendorNumber);
        //PurchaseOrderNumber = PurchaseOrder."No.";

        if PurchaseOrder."Buy-from Vendor No." <> '60000' then
            Error('Purchase order was not created with the correct vendor number. Expected: %1, found: %2',
                '60000', PurchaseOrder."Buy-from Vendor No.");

        if PurchaseOrder."Buy-from Vendor Name" <> 'Test Vendor' then
            Error('Purchase order was not created with the correct vendor name. Expected: %1, found: %2',
                'Test Vendor', PurchaseOrder."Buy-from Vendor Name");
        if PurchaseOrder."Buy-from Address" <> 'Test Address' then
            Error('Purchase order was not created with the correct address. Expected: %1, found: %2',
                'Test Address', PurchaseOrder."Buy-from Address");

        IsInserted := PurchaseOrder.Insert(true);
        if not IsInserted then
            Error('Purchase order was not inserted');

        PurchaseOrderLine.Init();
        PurchaseOrderLine.Validate("Document Type", PurchaseOrderLine."Document Type"::Order);
        PurchaseOrderLine.Validate("Document No.", PurchaseOrder."No.");
        PurchaseOrderLine."Line No." := 10000;
        PurchaseOrderLine.Validate(Type, PurchaseOrderLine.Type::Item);
        PurchaseOrderLine."No." := ItemNumber;
        PurchaseOrderLine."Location Code" := 'ADVANIA';
        PurchaseOrderLine.Quantity := 100;

        Assert.IsTrue(PurchaseOrderLine.Insert(true), 'Purchase order line was not inserted.');
        Assert.AreEqual(ItemNumber, PurchaseOrderLine."No.", 'Purchase order line was not created with the correct item number.');
        Assert.AreEqual(100, PurchaseOrderLine.Quantity, 'Purchase order line was not created with the correct quantity.');
        Assert.AreEqual('ADVANIA', PurchaseOrderLine."Location Code", 'Purchase order line was not created with the correct location code.');

        if PurchaseOrder.Status <> PurchaseOrder.Status::Released then
            PurchaseOrder.Status := PurchaseOrder.Status::Released;

        Assert.IsTrue(PurchaseOrder.Modify(true), 'Purchase order was not released.');
    end;

    [Test]
    internal procedure CreateWarehouseReceipt()
    begin
        SalesAndRecSetup.Get();
        WarehReceipt.Init();
        WarehReceipt."Location Code" := 'ADVANIA';
        // WarehReceipt.Get(())


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
        SalesOrderLine."Location Code" := 'ADVANIA';
        SalesOrderLine.Quantity := 1;

        Assert.IsTrue(SalesOrderLine.Insert(true), 'Sales order line was not inserted.');
        Assert.AreEqual(1, SalesOrderLine.Quantity, 'Sales order line was not created with the correct quantity.');
        Assert.AreEqual(ItemNumber, SalesOrderLine."No.", 'Sales order line was not created with the correct item number.');
        Assert.AreEqual('ADVANIA', SalesOrderLine."Location Code", 'Sales order line was not created with the correct location code.');
    end;


    var
        Item: Record Item;
        IsInserted: Boolean;
        Customer: Record Customer;
        Assert: Codeunit "Library Assert";
        ItemNumber: Code[20];
        CustomerNumber: Code[20];
        VendorNumber: Code[20];
        SalesOrderNumber: Code[20];
        NoSeries: Codeunit "No. Series";
        SalesAndRecSetup: record "Sales & Receivables Setup";
        SalesOrder: Record "Sales Header";
        SalesOrderLine: Record "Sales Line";
        Vendor: Record Vendor;
        PurchaseOrder: Record "Purchase Header";
        PurchaseOrderLine: Record "Purchase Line";
        WarehReceipt: Record "Warehouse Receipt Header";
    //PurchaseOrderNumber: Code[20];


}