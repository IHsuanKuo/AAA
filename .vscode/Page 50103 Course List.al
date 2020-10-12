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
        with courseRec do begin
            Init;
            Code := '80041';
            Name := 'Finance';
            Description := 'Basic knowledge of Finance';
            Type := Type::"Instructor Led";
            Duration := 3.0;
            Price := 1500.0;
            Active := true;
            Difficulty := 7;
            PassingRate := 80;
            Insert;
            Message('Already Insert');
        end;
        with courseRec do begin
            Init;
            Code := '80042';
            Name := 'C/SIDE Introduction';
            Description := 'Introduction to programming';
            Type := Type::"Instructor Led";
            Duration := 5.0;
            Price := 2500.0;
            Active := true;
            Difficulty := 8;
            PassingRate := 80;
            Insert;
            Message('Already Insert');
        end;
        with courseRec do begin
            Init;
            Code := '80043';
            Name := 'Introduction';
            Description := 'Introduction to Microsoft Dynamics Nav';
            Type := Type::"Remote Training";
            Duration := 2.0;
            Price := 1000.0;
            Active := true;
            Difficulty := 4;
            PassingRate := 60;
            Insert;
            Message('Already Insert');
        end;
        with courseRec do begin
            Init;
            Code := '80049';
            Name := 'Application Setup';
            Description := 'Basic knowledge of application setup';
            Type := Type::"e-Learning";
            Duration := 2.0;
            Price := 1000.0;
            Active := true;
            Difficulty := 5;
            PassingRate := 65;
            Insert;
            Message('Already Insert');
        end;
        with courseRec do begin
            Init;
            Code := '80050';
            Name := 'Business Intelligence';
            Description := 'Basic knowledge of Business Intelligence';
            Type := Type::"e-Learning";
            Duration := 1.0;
            Price := 500.0;
            Active := true;
            Difficulty := 5;
            PassingRate := 65;
            Insert;
            Message('Already Insert');
        end;
        with courseRec do begin
            Init;
            Code := '80055';
            Name := 'C/SIDE Solution Development';
            Description := 'Advanced topics in programming';
            Type := Type::"Instructor Led";
            Duration := 5.0;
            Price := 2500.0;
            Active := true;
            Difficulty := 10;
            PassingRate := 75;
            Insert;
            Message('Already Insert');
        end;
    end;

    trigger OnAfterGetRecord();
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