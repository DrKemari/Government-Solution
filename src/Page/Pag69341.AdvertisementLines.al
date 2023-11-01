#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 69341 "Advertisement Lines"
{
    PageType = ListPart;
    SourceTable = "Vacancy Requisition Lines";
    SourceTableView = where(Advertise = filter(false));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                // field("Vacancy No"; "Vacancy No")
                // {
                //     ApplicationArea = Basic;
                //     ToolTip = 'Specifies the value of the Vacancy No field.';
                // }
                field("Type of Contract"; Rec."Type of Contract")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Type of Contract field.';
                }
                field("Requisition Type"; Rec."Requisition Type")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Requisition Type field.';
                }
                field("Job Id"; Rec."Job Id")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Job Id field.';
                }
                field("Job Description"; Rec."Job Description")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Job Description field.';
                }
                field("Planned Qty"; Rec."Planned Qty")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Planned Qty field.';
                }
                field("Requested Qty"; Rec."Requested Qty")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Requested Qty field.';
                }
                field("Planned Start Date"; Rec."Planned Start Date")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Planned Start Date field.';
                }
                field("Planned End Date"; Rec."Planned End Date")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Planned End Date field.';
                }
                field("Applications End Time"; Rec."Applications End Time")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Applications End Time field.';
                }
                field("Applications End Date"; Rec."Applications End Date")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Applications End Date field.';
                }
                field("Applications Start Date"; Rec."Applications Start Date")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Applications Start Date field.';
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action(Advertise)
            {
                ApplicationArea = Basic;
                Image = Alerts;
                ToolTip = 'Executes the Advertise action.';
                trigger OnAction()
                begin
                    if Confirm(TXT002) = true then begin
                        CurrPage.SetSelectionFilter(VacancyRequisitionLines);
                        if VacancyRequisitionLines.FindSet then begin
                            repeat
                                VacancyRequisitionLines.Advertise := true;
                                VacancyRequisitionLines."Advertised By" := UserId;
                                VacancyRequisitionLines."Advertised Date" := Today;
                                VacancyRequisitionLines.Modify(true);
                                //modify the vacancies table'
                                Vacancy.Reset;
                                Vacancy.SetRange("Requisition No.", VacancyRequisitionLines."Job Id");
                                if Vacancy.FindFirst then begin
                                    Vacancy.Advertise := true;
                                    Vacancy.Status := Vacancy.Status::Advertised;
                                    Vacancy."Advertised By" := UserId;
                                    Vacancy."Advertised Date" := Today;
                                    Vacancy.Modify(true);
                                end;

                            until VacancyRequisitionLines.Next = 0;
                            Clear(VacancyRequisitionLines);
                        end;
                        Message(TXT001, VacancyRequisitionLines."Job Id");
                    end
                end;
            }
            group(Shortlisting)
            {
                action("Shortlisting Criteria")
                {
                    ApplicationArea = Basic;
                    Image = List;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    RunObject = Page "Shortlisting Criteria";
                    RunPageLink = "Entry No." = field("Line No."), "Requisition No." = field("Requisition No.");
                    ToolTip = 'Executes the Shortlisting Criteria action.';
                }
                action("Filter Based on Criteria")
                {
                    ApplicationArea = Basic;
                    Image = FilterLines;
                    Promoted = true;
                    PromotedIsBig = true;
                    ToolTip = 'Executes the Filter Based on Criteria action.';
                    trigger OnAction()
                    begin
                        CurrPage.SetSelectionFilter(VacancyRequisitionLines);
                        if VacancyRequisitionLines.FindSet then begin
                            repeat
                                ShortlistingCriteria.BasedOnCriteria(VacancyRequisitionLines);
                            until VacancyRequisitionLines.Next = 0;
                            Clear(VacancyRequisitionLines);
                        end;
                    end;
                }
            }
        }
    }

    var
        VacancyRequisitionLines: Record "Vacancy Requisition Lines";
        ShortlistingCriteria: Codeunit "Shortlisting Criteria";
        TXT001: label 'The vacancy %1,has been advertised succesfully';
        Vacancy: Record Vacancy1;
        TXT002: label 'Are you sure you want to advertise the selected vacancies?';
}

#pragma implicitwith restore

