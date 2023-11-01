report 69074 "Leave Replacement"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Leave Replacement.rdlc';

    dataset
    {
        dataitem("HR Leave Application";"HR Leave Application")
        {
            DataItemTableView = WHERE(Posted=FILTER(true),Status=FILTER(Released));
            column(ApplicationCode_HRLeaveApplication;"HR Leave Application"."Application Code")
            {
            }
            column(StartDate_HRLeaveApplication;"HR Leave Application"."Start Date")
            {
            }
            column(ReturnDate_HRLeaveApplication;"HR Leave Application"."Return Date")
            {
            }
            column(Reliever_HRLeaveApplication;"HR Leave Application".Reliever)
            {
            }
            column(RelieverName_HRLeaveApplication;"HR Leave Application"."Reliever Name")
            {
            }

            trigger OnAfterGetRecord()
            begin
                //get the reliever from the leave table
                    RequestorID:='';
                    LeaveApplication.Reset;
                    LeaveApplication.SetRange("Application Code","HR Leave Application"."Application Code");
                    if LeaveApplication.FindFirst then begin
                      //check that the user is enabled on users table
                      //get requestor user id
                      UserSetup1.Reset;
                      UserSetup1.SetRange("Employee No.",LeaveApplication."Employee No");
                      if UserSetup1.FindFirst then begin
                        RequestorID:=UserSetup1."User ID";
                      end;
                      UserSetup.Reset;
                      UserSetup.SetRange("Employee No.",LeaveApplication.Reliever);
                            if UserSetup.FindFirst then begin
                               User.Reset;
                               User.SetRange("User Name",UserSetup."User ID");
                                if User.FindSet then begin
                                        if User.State=User.State::Enabled then begin
                                          //check the date to be today--automated report on job queue
                                             if LeaveApplication."Start Date"=Today then begin
                                                    GroupMember.Reset;
                                                    GroupMember.SetRange("User Name",RequestorID);
                                                    if GroupMember.FindSet then begin
                                                      repeat
                                                         //replace the user on workflow user groups
                                                       GroupMember1."Workflow User Group Code":=GroupMember."Workflow User Group Code";
                                                       GroupMember1."User Name":=User."User Name";
                                                       GroupMember1."Sequence No.":=GroupMember."Sequence No.";
                                                       GroupMember1.Insert();
                                                       GroupMember.Delete;
                               //send email
                                                      until GroupMember.Next=0
                                                    end;
                                              end;
                                              //IF RETURN IS TODAY--automated report on job queue
                                               if LeaveApplication."Return Date"=Today then begin
                                                    GroupMember.Reset;
                                                    GroupMember.SetRange("User Name",User."User Name");
                                                    if GroupMember.FindSet then begin
                                                      repeat
                                                         //replace the user on workflow user groups
                                                       GroupMember1."Workflow User Group Code":=GroupMember."Workflow User Group Code";
                                                       GroupMember1."User Name":=RequestorID;
                                                       GroupMember1."Sequence No.":=GroupMember."Sequence No.";
                                                       GroupMember1.Insert();
                                                       GroupMember.Delete;
                               //send email
                                                      until GroupMember.Next=0
                                                    end;
                                              end;
                                    end;
                              end;
                         end;
                    end

            end;
        }
    }

    requestpage
    {

        layout
        {
        }

        actions
        {
        }
    }

    labels
    {
    }

    var
        User: Record User;
        GroupMember: Record "Workflow User Group Member";
        LeaveApplication: Record "HR Leave Application";
        UserSetup: Record "User Setup";
        UserSetup1: Record "User Setup";
        RequestorID: Code[30];
        GroupMember1: Record "Workflow User Group Member";
}

