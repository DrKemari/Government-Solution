report 80015 "Create Employee BR Participate"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Create Employee BR Participate.rdlc';

    dataset
    {
        dataitem(Employee;Employee)
        {
            DataItemTableView = WHERE(Status=CONST(Active));
            RequestFilterFields = "No.","Directorate Code","Department Code";

            trigger OnAfterGetRecord()
            begin
                EmployeeSurvey.Reset;
                EmployeeSurvey.SetRange("Target Respondent Type",EmployeeSurveyParticipant."Target Respondent Type"::Employees);
                EmployeeSurvey.SetRange("Document No.",BusinessRSCode);
                if EmployeeSurvey.FindFirst then begin
                   EmployeeSurvey.TestField("Response Due Date");
                   DueDate:=EmployeeSurvey."Response Due Date";
                   BRDescription:=EmployeeSurvey.Description;
                   Email:=Employee."Company E-Mail";

                //ERROR('DueDate is %1 and ,BRDescription %2',DueDate,BRDescription);
                EmployeeSurveyParticipant.Init;
                EmployeeSurveyParticipant."Target Respondent Type":=EmployeeSurveyParticipant."Target Respondent Type"::Employees;
                EmployeeSurveyParticipant."Document No.":=BusinessRSCode;
                EmployeeSurveyParticipant."Participant ID":=Employee."No.";
                EmployeeSurveyParticipant.Name:=Employee.FullName;
                EmployeeSurveyParticipant.Email:=Employee."Company E-Mail";
                EmployeeSurveyParticipant."Response Due Date":=DueDate;
                EmployeeSurveyParticipant.Description:=BRDescription;
                Message(EmployeeSurveyParticipant.Description);
                EmployeeSurveyParticipant.Insert;
                //MESSAGE (EmployeeSurveyParticipant.Name);
                end;
            end;

            trigger OnPostDataItem()
            begin
                Message('Business Research Survey Participant for Business Research Survey  has been Created,Proceed to Business Research Survey List to send Invites');
            end;

            trigger OnPreDataItem()
            begin
                if BusinessRSCode='' then
                  Error('Business Research Code Must have a Value');
            end;
        }
    }

    requestpage
    {

        layout
        {
            area(content)
            {
                field(BusinessRSCode;BusinessRSCode)
                {
                    TableRelation = "Business Research Survey"."Document No.";
                }
            }
        }

        actions
        {
        }
    }

    labels
    {
    }

    var
        BusinessRSCode: Code[30];
        BusinessResearchSurvey: Record "Business Research Survey";
        BRSurveyParticipant: Record "BR Survey Participant";
        DueDate: Date;
        EmployeeSV: Code[30];
        PolicyDetails: Record Policy;
        PolicyAttestationInvitation: Record "Policy Attestation Invitation";
        EmployeeSurvey: Record "Business Research Survey";
        EmployeeSurveyParticipant: Record "BR Survey Participant";
        BRDescription: Text;
        Email: Code[30];
}

