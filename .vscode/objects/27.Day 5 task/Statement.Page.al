page 50302 "Statement Page"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Statement Table";
    Caption = 'Discount Calculator';

    layout
    {
        area(Content)
        {
            group(Discount)
            {
                field(Amount; Rec.Amount)
                {
                    ApplicationArea = All;
                    Caption = 'Total Purchase Amount';
                    ToolTip = 'Enter the total purchase amount.';

                    
                }

            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(CalculateDiscount)
            {
                ApplicationArea = All;
                Caption = 'Calculate Discount';
                ToolTip = 'Calculate the discount based on the total purchase amount.';
                Image = Calculate;

                trigger OnAction()
                var
                    Discount: Decimal;
                begin
                    if Rec.Amount > 1000 then
                        Discount := Rec.Amount * 1
                    else if Rec.Amount > 500 then
                        Discount := Rec.Amount * 0.5
                    else if Rec.Amount > 100 then
                        Discount := Rec.Amount * 0.1
                    else
                        Discount := 0;

                    if Discount > 0 then
                        Message('The discount is: %1', Discount)
                    else
                        Message('No discount applicable.');
                end;
            }
        }

        
    }

    var
        myInt: Integer;
}