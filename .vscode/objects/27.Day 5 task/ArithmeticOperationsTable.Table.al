table 50301 ArithmeticOperationsTable
{
    DataClassification = ToBeClassified;
    Caption = 'Arithmetic Operations Table';

    fields
    {
        field(1; Number1; Integer)
        {
            Caption = 'Number 1';
            DataClassification = ToBeClassified;
            Editable = true;

        }
        field(2; Number2; Integer)
        {
            Caption = 'Number 2';
            DataClassification = ToBeClassified;
            Editable = true;

        }
        field(3; Age; Integer)
        {
            Caption = 'Age';
            DataClassification = ToBeClassified;
            Editable = true;

        }
        field(4; Result; Integer)
        {
            Caption = 'Result';
            DataClassification = ToBeClassified;
            Editable = false;

        }
    }

    keys
    {
        key(PK; "Number1", Number2)
        {
            Clustered = true;
        }
    }

    procedure CheckDrivingAge(AgeInt: Integer)
    var
        Age: Integer;
    begin
        Age := AgeInt;
        // Check the driving eligibility based on age
        case Age of
            0 .. 17: // Adjusted range to avoid overlap
                Message('You cannot drive');
            18 .. 79: // Adjusted range to avoid overlap
                Message('You are okay to drive');
            80 .. 100:
                Message('You are too old to drive');
            else
                Message('Invalid age. Please enter a valid age between 0 and 100.');
        end;
    end;

    procedure CheckVotingAge(AgeVote: Integer)
    var
        Age: Integer;
    begin
        Age := AgeVote;
        // Check the voting eligibility based on age
        if Age >= 18 then
            Message('You are eligible to vote')
        else
            Message('You are not eligible to vote');
    end;

    procedure CheckUnaryOperation(UnaryInt: Integer)
    var
        Unary: Integer;
    begin
        Unary := UnaryInt;
        Unary := -Unary;
        Message('Unary operation on %1 gives %2', UnaryInt, Unary);
    end;

    procedure CheckBinaryOperation(Binary1: Integer; Binary2: Integer)
    var
        Binar1: Integer;
        Binar2: Integer;
    begin
        Binar1 := Binary1;
        Binar2 := Binary2;
        Rec.Result := Binar1 * Binar2;

        if (Binar1 <> 0) and (Binar2 <> 0) then begin
            Message('Binary operation on %1 and %2 gives %3:', Binar1, Binar2, Rec.Result);
        end else begin
            Message('Please enter valid non-zero numbers for binary operation');
        end;
    end;

    procedure ProductQuantities()
    begin
        ItemNames.Add('Toys');
        ItemQty.Add(10);
        ItemNames.Add('Books');
        ItemQty.Add(20);
        ItemNames.Add('Clothes');
        ItemQty.Add(30);
        ItemNames.Add('Electronics');
        ItemQty.Add(40);
        ItemNames.Add('Furniture');
        ItemQty.Add(50);
        ItemNames.Add('Groceries');
        ItemQty.Add(60);

        Message('Before sale');
        foreach ItemText in ItemNames do
            Message(ItemText);
    end;

    procedure AddQty()
    begin
        ItemNames.Add('Suvenirs');
        ItemQty.Add(10);
        ItemNames.Add('Toys');
        ItemQty.Add(20);
        ItemNames.Add('Keyboard');
        ItemQty.Add(30);

        Message('Add qty for the list items');
        foreach ItemText in ItemNames do begin
            ItemInt := ItemQty.Get(ItemNames.IndexOf(ItemText));
            Message('%1: %2', ItemText, ItemInt);
        end;

    end;

    procedure UpdateQty()
    begin

        ItemNames.Add('Suvenirs');
        ItemQty.Add(10);
        ItemNames.Add('Toys');
        ItemQty.Add(20);
        ItemNames.Add('Keyboard');
        ItemQty.Add(30);
        ItemNames.Add('Milk');
        ItemQty.Add(40);
        ItemNames.Add('Bread');
        ItemQty.Add(50);
        ItemNames.Add('Eggs');
        ItemQty.Add(60);

        Message('Before sales');
        foreach ItemText in ItemNames do begin
            ItemInt := ItemQty.Get(ItemNames.IndexOf(ItemText));
            Message('%1: %2', ItemText, ItemInt);
        end;

        if ItemNames.Count > 0 then begin
            ItemNames.RemoveAt(1); // Remove the first item
            ItemQty.RemoveAt(1);
            ItemNames.RemoveAt(3); // Remove the second item
            ItemQty.RemoveAt(3);

        end;

        Message('After sales');
        foreach ItemText in ItemNames do begin
            ItemInt := ItemQty.Get(ItemNames.IndexOf(ItemText));
            Message('%1: %2', ItemText, ItemInt);
        end;


    end;

    procedure DictionaryProductProcess()
    var
        Product: Text[50];
        KeySet: List of [Text[50]];
        Value: Integer;
        ValuesList: list of [Text[10]];
    begin
        ProductNames.Add('Toys', '£10');
        ProductNames.Add('Books', '£20');
        ProductNames.Add('Clothes', '£30');
        ProductNames.Add('Electronics', '£40');
        ProductNames.Add('Furniture', '£50');
        ProductNames.Add('Groceries', '£60');

        foreach Product in ProductNames.Keys do begin
            Message(Product);
        end;


        Message('Get function');
        Product := ProductNames.Get('Books');
        Message(Format(Product));


        Message('List function');
        ValuesList := ProductNames.Values();

        foreach Product in ValuesList do begin
            Message('Value: %1', Product);
        end;
    end;

    procedure AddNewItemsToDictionary()
    var

    begin
        ProductNames.Add('Toys2', '£100');
        ProductNames.Add('Books2', '£200');
        ProductNames.Add('Clothes2', '£300');
        ProductNames.Add('Electronics2', '£400');
        ProductNames.Add('Furniture2', '£500');
        ProductNames.Add('Groceries2', '£600');

        foreach Product in ProductNames.Keys do begin
            Message(Product);
        end;


        ValuesList := ProductNames.Values();

        foreach ProductPrice in ValuesList do begin
            Message('Value: %1', ProductPrice);
        end;

        foreach Product in ProductNames.Keys do begin
            ProductPrice := ProductNames.Get(Product);
            Message('%1: %2', Product, ProductPrice);
        end;
    end;

    var
        ProductPrice: Text[50];
        Product: Text[50];
        ProductNames: Dictionary of [Text[50], Text[10]];
        ItemNames: List of [Text[50]];
        ItemQty: List of [Integer];
        ItemText: Text[50];
        ItemInt: Integer;
        ValuesList: list of [Text[10]];

}