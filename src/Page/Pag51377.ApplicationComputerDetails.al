#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 51377 "Application Computer Details"
{
    PageType = List;
    SourceTable = "Accreditation Computer Details";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Application No."; Rec."Application No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Application No. field.';
                }
                field("No. of Computers"; Rec."No. of Computers")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. of Computers field.';
                }
                field("Processor type"; Rec."Processor type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Processor type field.';
                }
                field("Processor speed"; Rec."Processor speed")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Processor speed field.';
                }
                field("RAM Capacity"; Rec."RAM Capacity")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the RAM Capacity field.';
                }
                field("Hard disk capacity"; Rec."Hard disk capacity")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Hard disk capacity field.';
                }
            }
        }
        area(factboxes)
        {
            systempart(Control10; Outlook)
            {
                ApplicationArea = Basic;
            }
            systempart(Control11; Notes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control12; MyNotes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control13; Links)
            {
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

