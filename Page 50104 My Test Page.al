page 50104 "My Test Page"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = Course;

    layout
    {
        area(Content)
        {
            group(GroupName)
            {
                field(value1; value1)
                {
                    ApplicationArea = All;

                }
                field(value2; value2)
                {
                    ApplicationArea = All;

                }
            }
            group(Output)
            {
                field(result; result)
                {
                    ApplicationArea = All;

                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action("Excute")
            {
                ApplicationArea = All;

                trigger OnAction()
                begin
                    excute_Result;
                end;
            }
            action(ActionName)
            {
                ApplicationArea = All;

                trigger OnAction()
                begin

                end;
            }
        }
    }

    var
        myInt: Integer;
        value1: Integer;
        value2: Integer;
        result: Boolean;


    procedure excute_Result();
    begin
        result := value1 > value2;
    end;
}
