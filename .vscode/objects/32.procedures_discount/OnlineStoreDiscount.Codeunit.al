codeunit 50306 "OnlineStoreDiscount"
{
    procedure CalculateTotalWithDiscount(PurcahseLine: Record "Purchase Line")
    begin
        if PurcahseLine."Unit Price (LCY)" <> 0 then begin
            PurcahseLine."Discount Price" := PurcahseLine."Unit Price (LCY)" * 0.1;
        end else begin
            PurcahseLine."Discount Price" := 0;
        end;
        PurcahseLine.Modify();
    end;

    procedure CalculateTotalWithDiscount2()
    var
        TotalAmount: Decimal;
        DiscountAmount: Decimal;
    begin
        TotalAmount := 200.20;
        DiscountAmount := TotalAmount * 0.1;

        Message('Total Amount: %1, Discount Amount: %2', TotalAmount, DiscountAmount);

    end;
}