#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
PageExtension 50027 "pageextension50027" extends "Job List" 
{

    //Unsupported feature: Property Insertion (DeleteAllowed) on ""Job List"(Page 89)".


    //Unsupported feature: Property Insertion (SourceTableView) on ""Job List"(Page 89)".

    layout
    {
        modify("No.")
        {
            Caption = 'Project Number';
        }
        modify(Description)
        {
            Caption = 'Project Descrption';
        }

        //Unsupported feature: Property Insertion (Visible) on ""Bill-to Customer No."(Control 8)".

        modify("Person Responsible")
        {
            Caption = '<Person Responsible>';
        }
        modify("Project Manager")
        {
            Caption = '<Regional Officer>';
        }
        addafter("% Invoiced")
        {
            field("Project Budget"; Rec."Project Budget")
            {
                ApplicationArea = Basic;
            }
            field("Actual Project Costs"; Rec."Actual Project Costs")
            {
                ApplicationArea = Basic;
            }
            field(Commitments; Rec.Commitments)
            {
                ApplicationArea = Basic;
            }
            field("WIP Method"; Rec."WIP Method")
            {
                ApplicationArea = Basic;
            }
            field("Starting Date"; Rec."Starting Date")
            {
                ApplicationArea = Basic;
            }
            field("Ending Date"; Rec."Ending Date")
            {
                ApplicationArea = Basic;
            }
        }
    }
}

#pragma implicitwith restore

