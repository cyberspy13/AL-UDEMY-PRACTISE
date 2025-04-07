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

}