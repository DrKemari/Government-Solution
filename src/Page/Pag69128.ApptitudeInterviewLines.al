#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 69128 "Apptitude Interview Lines"
{
    InsertAllowed = false;
    PageType = ListPart;
    SourceTable = "Shortlisting Lines";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Line No"; Rec."Line No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Line No field.';
                }
                field("Application No"; Rec."Application No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Application No field.';
                }
                field("Full Name"; Rec."Full Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Full Name field.';
                }
                field(Email; Rec.Email)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Email field.';
                }
                field("Interview Location"; Rec."Interview Location")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Interview Location field.';
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
                field("Interview Due Date"; Rec."Interview Due Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Interview Due Date field.';
                }
                field("Written Interview Score"; Rec."Written Interview Score")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Written Interview Score field.';
                }
                field("Apptitude Interview Score"; Rec."Apptitude Interview Score")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Apptitude Interview Score field.';
                }
                field("Oral Interview Score"; Rec."Oral Interview Score")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Oral Interview Score field.';
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            group(Shortlisting)
            {
                Image = Administration;
                action("Shortlist for Oral")
                {
                    ApplicationArea = Basic;
                    Image = AddAction;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    ToolTip = 'Executes the Shortlist for Oral action.';
                    trigger OnAction()
                    begin
                        CurrPage.SetSelectionFilter(ShortlistingLines);
                        if ShortlistingLines.FindSet then begin
                            repeat
                                //Modify status to Shortlisting Type

                                JobApplicationTable.Reset;
                                JobApplicationTable.SetRange("Application No", ShortlistingLines."Application No");
                                if JobApplicationTable.FindSet then begin
                                    JobApplicationTable."Shortlisting Type" := JobApplicationTable."shortlisting type"::Oral;
                                    JobApplicationTable.Status := JobApplicationTable.Status::"Oral&Written";
                                    JobApplicationTable.Modify(true);
                                end;

                                VacancyRequisitionLines.Reset;
                                VacancyRequisitionLines.SetRange("Job Id", ShortlistingLines."Job Id.");
                                if VacancyRequisitionLines.FindSet then begin
                                    VacancyRequisitionLines.Status := VacancyRequisitionLines.Status::"Oral&Written";
                                    VacancyRequisitionLines.Modify(true);
                                end;

                            until ShortlistingLines.Next = 0;
                            Clear(ShortlistingLines);
                        end;
                        Message('Applicants Shortlisted for Oral Interview');
                    end;
                }
                action("Shortlist for Written")
                {
                    ApplicationArea = Basic;
                    Image = AddAction;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    ToolTip = 'Executes the Shortlist for Written action.';
                    trigger OnAction()
                    begin
                        CurrPage.SetSelectionFilter(ShortlistingLines);
                        if ShortlistingLines.FindSet then begin
                            repeat
                                //Modify status to Shortlisting Type

                                JobApplicationTable.Reset;
                                JobApplicationTable.SetRange("Application No", ShortlistingLines."Application No");
                                if JobApplicationTable.FindSet then begin
                                    JobApplicationTable."Shortlisting Type" := JobApplicationTable."shortlisting type"::Written;
                                    JobApplicationTable.Status := JobApplicationTable.Status::Apptitude;
                                    JobApplicationTable.Modify(true);
                                end;

                                VacancyRequisitionLines.Reset;
                                VacancyRequisitionLines.SetRange("Job Id", ShortlistingLines."Job Id.");
                                if VacancyRequisitionLines.FindSet then begin
                                    VacancyRequisitionLines.Status := VacancyRequisitionLines.Status::Apptitude;
                                    VacancyRequisitionLines.Modify(true);
                                end;

                            until ShortlistingLines.Next = 0;
                            Clear(ShortlistingLines);
                        end;
                        Message('Applicants Shortlisted for Written Interview');
                    end;
                }
            }
        }
    }

    var
        OralInterviewLines: Page "Oral Interview Lines";
        ShortlistingLines: Record "Shortlisting Lines";
        VacancyRequisitionLines: Record "Vacancy Requisition Lines";
        JobApplicationTable: Record "Job Application Table";
}

#pragma implicitwith restore

