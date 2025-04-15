page 50301 ArithmeticOperationsPage
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = ArithmeticOperationsTable;
    Caption = 'Arithmetic Operations';

    layout
    {
        area(Content)
        {
            group("Arithmetic Operations")
            {
                field(Number1; Rec.Number1)
                {

                    ApplicationArea = All;


                }
                field(Number2; Rec.Number2)
                {

                    ApplicationArea = All;

                }
                field(Age; Rec.Age)
                {
                    ApplicationArea = All;
                }
                field(Result; Rec.Result)
                {
                    ApplicationArea = All;
                    Editable = false;
                }


            }
        }

    }

    actions
    {
        area(Processing)
        {
            action(Sum)
            {
                trigger OnAction()
                begin
                    Message('Sum of %1 and %2 is %3', Rec.Number1, Rec.Number2, Rec.Number1 + Rec.Number2);
                end;
            }
            action(Difference)
            {
                trigger OnAction()
                begin
                    Message('Difference of %1 and %2 is %3', Rec.Number1, Rec.Number2, Rec.Number1 - Rec.Number2);

                end;
            }
            action(Product)
            {
                trigger OnAction()
                begin
                    Message('Product of %1 and %2 is %3', Rec.Number1, Rec.Number2, Rec.Number1 * Rec.Number2);
                end;
            }
            action(Quotient)
            {
                trigger OnAction()
                begin
                    Message('Quotient of %1 and %2 is %3', Rec.Number1, Rec.Number2, Rec.Number1 / Rec.Number2);
                end;
            }
            action(Remainder)
            {
                trigger OnAction()
                begin
                    Message('Remainder of %1 and %2 is %3', Rec.Number1, Rec.Number2, Rec.Number1 mod Rec.Number2);
                end;
            }
            action("Driving Age")
            {
                trigger OnAction()
                var
                    ArithmeticOperationRecord: Record ArithmeticOperationsTable;
                begin
                    ArithmeticOperationRecord.CheckDrivingAge(Rec.Age);
                end;
            }
            action("Voting Age")
            {
                trigger OnAction()
                var
                    ArithmeticOperationRecord: Record ArithmeticOperationsTable;
                begin
                    ArithmeticOperationRecord.CheckVotingAge(Rec.Age);
                end;
            }
            action("Unary Operator")
            {
                trigger OnAction()
                var
                    ArithmeticOperationRecord: Record ArithmeticOperationsTable;

                begin
                    ArithmeticOperationRecord.CheckUnaryOperation(Rec.Number1);
                end;
            }

            action("Binary Operator")
            {
                trigger OnAction()
                var
                    ArithmeticOperationRecord: Record ArithmeticOperationsTable;

                begin
                    ArithmeticOperationRecord.CheckBinaryOperation(Rec.Number1, Rec.Number2);
                end;
            }
            action("Display List")
            {
                trigger OnAction()
                var
                    ArithmeticOperationRecord: Record ArithmeticOperationsTable;
                begin
                    ArithmeticOperationRecord.ProductQuantities();
                end;
            }
            action("Add Qty")
            {
                trigger OnAction()
                var
                    ArithmeticOperationRecord: Record ArithmeticOperationsTable;
                begin
                    ArithmeticOperationRecord.AddQty();
                end;
            }
            action("Update Qty")
            {
                trigger OnAction()
                var
                    ArithmeticOperationRecord: Record ArithmeticOperationsTable;
                begin
                    ArithmeticOperationRecord.UpdateQty();

                end;
            }
            action("Dictionary Product Proces")
            {
                trigger OnAction()
                var
                    ArithmeticOperationRecord: Record ArithmeticOperationsTable;
                begin
                    ArithmeticOperationRecord.DictionaryProductProcess();
                end;
            }
            action("Add new items to the Dictionary")
            {
                trigger OnAction()
                var
                ArithmeticOperationRecord: Record ArithmeticOperationsTable;
                begin
                    ArithmeticOperationRecord.AddNewItemsToDictionary();

                end;
            }



        }

    }
}