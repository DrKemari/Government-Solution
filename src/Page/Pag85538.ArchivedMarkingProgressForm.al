#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 85538 "Archived Marking Progress Form"
{
    ApplicationArea = Basic;
    CardPageID = "Marking Process Progress Card";
    Editable = false;
    PageType = List;
    SourceTable = "Scripts Dispatch Header";
    SourceTableView = where("Approval Status"=filter(Released),
                            Posted=const(true),
                            "Document Type"=const("Marking Progress Form"));
    UsageCategory = History;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(DocumentNo;Rec."Document No.")
                {
                    ApplicationArea = Basic;
                }
                field(Description;Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field(ProjectNo;Rec."Project No.")
                {
                    ApplicationArea = Basic;
                }
                field(SittingCycle;Rec."Sitting Cycle")
                {
                    ApplicationArea = Basic;
                }
                field(CreatedBy;Rec."Created By")
                {
                    ApplicationArea = Basic;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control10;Outlook)
            {
            }
            systempart(Control11;Notes)
            {
            }
            systempart(Control12;MyNotes)
            {
            }
            systempart(Control13;Links)
            {
            }
        }
    }

    actions
    {
    }

    trigger OnAfterGetRecord()
    begin
        // UserSetup.RESET;
        // UserSetup.SETRANGE("User ID",USERID);
        // UserSetup.SETRANGE("Examination Admin",TRUE);
        // IF NOT UserSetup.FINDFIRST THEN BEGIN
        //  FILTERGROUP(2);
        //  SETFILTER("Created By",USERID);
        //  FILTERGROUP(0);
        //  END;
    end;

    trigger OnOpenPage()
    begin
        // UserSetup.RESET;
        // UserSetup.SETRANGE("User ID",USERID);
        // UserSetup.SETRANGE("Examination Admin",TRUE);
        // IF NOT UserSetup.FINDFIRST THEN BEGIN
        //  FILTERGROUP(2);
        //  SETFILTER("Created By",USERID);
        //  FILTERGROUP(0);
        //  END;
    end;

    var
        UserSetup: Record "User Setup";
}
