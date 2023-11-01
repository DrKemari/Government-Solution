report 80022 "Create Project BR Participate"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Create Project BR Participate.rdlc';

    dataset
    {
        dataitem(Contact;Contact)
        {

            trigger OnAfterGetRecord()
            begin

                EmployeeSurvey.Reset;
                EmployeeSurvey.SetRange("Target Respondent Type",EmployeeSurveyParticipant."Target Respondent Type"::Customers);
                EmployeeSurvey.SetRange("Document No.",EmployeeSV);
                if EmployeeSurvey.FindFirst then begin
                   EmployeeSurvey.TestField("Response Due Date");
                   DueDate:=EmployeeSurvey."Response Due Date";
                end;

                EmployeeSurveyParticipant.Init;
                EmployeeSurveyParticipant."Target Respondent Type":=EmployeeSurveyParticipant."Target Respondent Type"::Customers;
                EmployeeSurveyParticipant."Document No.":=EmployeeSV;
                EmployeeSurveyParticipant."Participant ID":=Contact."No.";
                EmployeeSurveyParticipant.Name:=Contact.Name;
                EmployeeSurveyParticipant.Email:=Contact."E-Mail";
                EmployeeSurveyParticipant."Response Due Date":=DueDate;
                EmployeeSurveyParticipant.Description:=EmployeeSurvey.Description;
                EmployeeSurveyParticipant.Insert;
            end;

            trigger OnPostDataItem()
            begin
                Message('Customer Survey Invites for Document No %1 has been Created,Proceed to Participant Invitation List to send Invites',EmployeeSV);
            end;

            trigger OnPreDataItem()
            begin
                if EmployeeSV='' then
                  Error('Document No Must have a Value');
            end;
        }
    }

    requestpage
    {

        layout
        {
            area(content)
            {
                field(EmployeeSurvey;EmployeeSV)
                {
                    TableRelation = "Business Research Survey"."Document No." WHERE ("Target Respondent Type"=CONST(Employees));
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
        EmployeeSV: Code[30];
        PolicyDetails: Record Policy;
        PolicyAttestationInvitation: Record "Policy Attestation Invitation";
        DueDate: Date;
        EmployeeSurvey: Record "Business Research Survey";
        EmployeeSurveyParticipant: Record "BR Survey Participant";
        ContactNew: Record Contact;
}

