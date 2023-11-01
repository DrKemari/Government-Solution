#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 69248 "HR Shortlisting Lines"
{
    Caption = 'Shorlisted Candidates';
    Editable = true;
    PageType = ListPart;
    SourceTable = "HR Shortlisted Applicants";

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                field("First Name"; Rec."First Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the First Name field.';
                }
                field("Middle Name"; Rec."Middle Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Middle Name field.';
                }
                field("Last Name"; Rec."Last Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Last Name field.';
                }
                field("ID No"; Rec."ID No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the ID No field.';
                }
                field(Gender; Rec.Gender)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Gender field.';
                }
                field("Marital Status"; Rec."Marital Status")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Marital Status field.';
                }
                field("Interview Date"; Rec."Interview Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Interview Date field.';
                }
                field("Interview Time"; Rec."Interview Time")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Interview Time field.';
                }
                field("Interview Venue"; Rec."Interview Venue")
                {
                    ApplicationArea = Basic;
                    ShowMandatory = true;
                    ToolTip = 'Specifies the value of the Interview Venue field.';
                }
                field("Stage Score"; Rec."Stage Score")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Stage Score field.';
                }
                field(Qualified; Rec.Qualified)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Qualified field.';
                }
                field("Reporting Date"; Rec."Reporting Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Response Date field.';
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("&Send Interview Invitation")
            {
                ApplicationArea = Basic;
                Caption = '&Send Interview Invitation';
                Image = SendMail;
                Promoted = true;
                PromotedCategory = Category4;
                ToolTip = 'Executes the &Send Interview Invitation action.';
                trigger OnAction()
                begin
                    Rec.TestField("Qualified for Written Intervie");


                    HRJobApplications.SetFilter(HRJobApplications."Application No", Rec."Job Application No");
                    Report.Run(53940, false, false, HRJobApplications);
                end;
            }
            action("&Print1")
            {
                ApplicationArea = Basic;
                Caption = '&Print1';
                Image = PrintReport;
                Promoted = true;
                PromotedCategory = Category4;
                Visible = false;
                ToolTip = 'Executes the &Print1 action.';
                trigger OnAction()
                begin
                    HRJobApplications.Reset;
                    HRJobApplications.SetRange(HRJobApplications."Application No", Rec."Job Application No");
                    if HRJobApplications.Find('-') then
                        Report.Run(55523, true, true, HRJobApplications);
                end;
            }
        }
    }

    var
        MyCount: Integer;
        HRJobApplications: Record "HR Job Applications";


    procedure GetApplicantNo() AppicantNo: Code[20]
    begin
        //AppicantNo:=Applicant;
    end;
}

#pragma implicitwith restore

