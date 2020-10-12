page 50103 "Course List"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = Course;
    CardPageId = "Course Card";
    Editable = false;
    Caption = 'Course List';

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field(Code; Code)
                {
                    ApplicationArea = All;

                }
                field(Name; Name)
                {
                    ApplicationArea = All;

                }
                field(Description; Description)
                {
                    ApplicationArea = All;

                }

                field(Level; Level)
                {
                    ApplicationArea = All;

                }

                field(suggestion; suggestion)
                {
                    ApplicationArea = All;

                }

                field(SPA; SPA)
                {
                    ApplicationArea = All;

                }
            }
        }
        area(Factboxes)
        {

        }
    }

    actions
    {
        area(Processing)
        {
            action(ActionName)
            {
                ApplicationArea = All;

                trigger OnAction();
                begin

                end;
            }
            action("Inset Table")
            {
                trigger OnAction();
                begin
                    InsertNewRecord();
                end;
            }
        }
    }
    var

        Level: Text[30];
        suggestion: Text[80];
        SPA: Boolean;

    procedure InsertNewRecord();
    var
        courseRec: Record Course;
    begin
        with courseRec do begin
            Init;
            Code := '80040';
            Name := 'Installation & Configuration';
            Description := 'Basic knowledge of Installation & configuration';
            Type := Type::"Remote Training";
            Duration := 2.0;
            Price := 1000.0;
            Active := true;
            Difficulty := 5;
            PassingRate := 75;
            Insert;
            Message('Already Insert');
        end;
    end;

    trigger OnAfterGetCurrRecord();
    begin
        Level := '';
        suggestion := '';
        SPA := false;
        case Difficulty of
            1 .. 5:
                begin
                    Level := 'Beginner';
                    suggestion := 'Take e-eLeraning or remote training';
                end;
            6 .. 8:
                begin
                    Level := 'Advanced';
                    suggestion := 'Attend instructor-Led';
                end;
            9 .. 10:
                begin
                    Level := 'Advanced';
                    suggestion := 'Attend instructor-Led and self sdudy';
                end;
        end;
        if (passingRate >= 70) And (Difficulty >= 6) then
            SPA := true;
    end;
}