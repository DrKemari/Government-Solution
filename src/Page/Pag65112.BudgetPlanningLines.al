#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 65112 "Budget Planning Lines"
{
    Caption = 'Budget Planning Lines';
  //  DataCaptionExpression = Caption;
    PageType = ListPart;
    PromotedActionCategories = 'New,Process,Report,Outlook';
    SourceTable = "Project Budget Planning Line";

    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                field("Project Budget ID"; Rec."Project Budget ID")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Project Budget ID field.';
                }
                field("Job No."; Rec."Job No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Job No. field.';
                }
                field("Job Task No."; Rec."Job Task No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the number of the related job task.';
                }
                field("Line Type"; Rec."Line Type")
                {
                    ApplicationArea = Jobs;
                    Editable = false;
                    ToolTip = 'Specifies the type of planning line.';
                }
                field(Quantity; Rec.Quantity)
                {
                    ApplicationArea = Jobs;
                    ToolTip = 'Specifies the number of units of the resource, item, or general ledger account that should be specified on the planning line. If you later change the No., the quantity you have entered remains on the line.';
                }
                field(Type; Rec.Type)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Type field.';
                }
                field("No."; Rec."No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. field.';
                }
                field("Budget Type"; Rec."Budget Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Budget Type field.';
                }
                field("Job Budget Templates"; Rec."Job Budget Templates")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Job Budget Templates field.';
                }
                field("Unit Cost (LCY)"; Rec."Unit Cost (LCY)")
                {
                    ApplicationArea = Basic;
                    Editable = true;
                    ToolTip = 'Specifies the value of the Unit Cost (LCY) field.';
                }
                field("Total Cost"; Rec."Total Cost")
                {
                    ApplicationArea = Basic;
                    Editable = true;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Total Cost field.';
                }
                field("Total Cost (LCY)"; Rec."Total Cost (LCY)")
                {
                    ApplicationArea = Jobs;
                    Editable = false;
                    ToolTip = 'Specifies the total cost for the planning line. The amount is in the local currency.';
                }
                field("Directorate Code"; Rec."Directorate Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Directorate Code field.';
                }
                field("Department Code"; Rec."Department Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Department Code field.';
                }
                field(Division; Rec.Division)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Division field.';
                }
            }
        }
    }

    actions
    {
    }

    trigger OnInit()
    var
        SMTPMailSetup: Record "Email Account";
        MailManagement: Codeunit "Mail Management";
    begin
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec.Type := Rec.Type::"G/L Account";
    end;

    trigger OnOpenPage()
    var
        Job: Record Job;
    begin
        Rec.Type := Rec.Type::"G/L Account";
    end;
}

#pragma implicitwith restore

