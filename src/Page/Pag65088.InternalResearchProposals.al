#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 65088 "Internal Research Proposals"
{
    ApplicationArea = Basic;
    CardPageID = "Grant Funding Application Card";
    Editable = false;
    PageType = List;
    SourceTable = "Grant Funding Application";
    SourceTableView = where("Application Status" = const("Not Started"),
                            "Approval Status" = filter(Open | "Pending Approval"),
                            "Grant Class" = const(Internal));
    UsageCategory = Tasks;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Application No"; Rec."Application No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Application No field.';
                }
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document Date field.';
                }
                field("FOA ID"; Rec."FOA ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the FOA ID field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Opportunity  Title"; Rec."Opportunity  Title")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Opportunity  Title field.';
                }
                field("Call Type"; Rec."Call Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Call Type field.';
                }
                field("Grant Type"; Rec."Grant Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Grant Type field.';
                }
                field("Justification for Application"; Rec."Justification for Application")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Justification for Application field.';
                }
                field("Research Center"; Rec."Research Center")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Research Center field.';
                }
                field("Primary Research Program ID"; Rec."Primary Research Program ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Primary Research Program ID field.';
                }
                field("Primary Research Area"; Rec."Primary Research Area")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Primary Research Area field.';
                }
                field("Requested Grant Amount(LCY)"; Rec."Requested Grant Amount(LCY)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Requested Grant Amount(LCY) field.';
                }
                field("Awarded Grant Amount (LCY)"; Rec."Awarded Grant Amount (LCY)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Awarded Grant Amount (LCY) field.';
                }
                field("Approval Status"; Rec."Approval Status")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Approval Status field.';
                }
                field("Grant Admin Team Code"; Rec."Grant Admin Team Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Grant Admin Team Code field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

