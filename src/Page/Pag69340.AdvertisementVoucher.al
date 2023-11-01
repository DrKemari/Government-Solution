#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 69340 "Advertisement Voucher"
{
    PageType = Card;
    SourceTable = "Vacancy  Requisitions Table";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Manpower Plan ID"; Rec."Manpower Plan ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Manpower Plan ID field.';
                }
                field("Manpower Plan Name"; Rec."Manpower Plan Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Manpower Plan Name field.';
                }
                field("Department Code"; Rec."Department Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Department Code field.';
                }
                field("Department Name"; Rec."Department Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Department Name field.';
                }
                field("Global Dimension 1"; Rec."Global Dimension 1")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Global Dimension 1 field.';
                }
                field("Global Dimension 1 Name"; Rec."Global Dimension 1 Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Global Dimension 1 Name field.';
                }
                field("Global Dimension 2"; Rec."Global Dimension 2")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Global Dimension 2 field.';
                }
                field("Global Dimension 2 Name"; Rec."Global Dimension 2 Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Global Dimension 2 Name field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Status field.';
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Created By field.';
                }
                field("Created On"; Rec."Created On")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Created On field.';
                }
            }
            part(Control17; "Advertisement Lines")
            {
                SubPageLink = "Requisition No." = field("No.");
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
        area(navigation)
        {
            action("Get Open Vacancies")
            {
                ApplicationArea = Basic;
                Image = GetLines;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ToolTip = 'Executes the Get Open Vacancies action.';
                // trigger OnAction()
                // begin
                //     ShortlistingCriteria.GetOpenVacancies(Rec);
                // end;
            }
            action(Advertise)
            {
                ApplicationArea = Basic;
                Image = Alerts;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedIsBig = true;
                ToolTip = 'Executes the Advertise action.';
                // trigger OnAction()
                // begin
                //     if Confirm(TXT003) = true then begin
                //         ShortlistingCriteria.AdvertiseVacancies(Rec);

                //     end;
                //     Message(TXT002);
                // end;
            }
        }
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        //   "Document Type" := "document type"::Advert;
    end;

    var
        ShortlistingCriteria: Codeunit "Shortlisting Criteria";
        TXT001: label 'Vacancies succesfully Added';
        TXT002: label 'All Vacancies published succesfully';
        TXT003: label 'Are you sure you want to advertise all the vacancies';
}

#pragma implicitwith restore

