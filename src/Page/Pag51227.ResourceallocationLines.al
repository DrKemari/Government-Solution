#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 51227 "Resource allocation Lines"
{
    PageType = ListPart;
    SourceTable = "Site Inspection Comment";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                // field(Confirmed; Confirmed)
                // {
                //     ApplicationArea = Basic;
                // }
                // field("Team Leader"; "Team Leader")
                // {
                //     ApplicationArea = Basic;
                // }
                field("User ID"; Rec."User ID")
                {
                    ApplicationArea = Basic;
                    Caption = 'Task Number';
                }
                field("User Name"; Rec."User Name")
                {
                    ApplicationArea = Basic;
                }
                field("Date Created"; Rec."Date Created")
                {
                    ApplicationArea = Basic;
                }
                field("User Category"; Rec."User Category")
                {
                    ApplicationArea = Basic;
                    Caption = 'Resource No';
                }
                field("No Series"; Rec."No Series")
                {
                    ApplicationArea = Basic;
                    Caption = 'Work Category';
                }
                field(Observation; Rec.Observation)
                {
                    ApplicationArea = Basic;
                    Caption = 'Resource Name';
                }
                field("Report Status"; Rec."Report Status")
                {
                    ApplicationArea = Basic;
                }
                // field(Amount; Amount)
                // {
                //     ApplicationArea = Basic;
                // }
                // field(Notified; Notified)
                // {
                //     ApplicationArea = Basic;
                // }
                // field("Notified On"; "Notified On")
                // {
                //     ApplicationArea = Basic;
                // }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Invite Peer Reviewer")
            {
                ApplicationArea = Basic;
                Image = Info;

                trigger OnAction()
                begin
                    InvitationEmailRes(Rec);
                end;
            }
            action("Commission Peer Reviewer")
            {
                ApplicationArea = Basic;
                Image = Confirm;

                trigger OnAction()
                begin
                    CommisioningEmailRes(Rec);
                end;
            }
        }
    }

    var
        TotalCost: Decimal;
        CompInfo: Record "Company Information";
        //  SMTPMailSet: Record "Email Account";
        objCustomer: Record Resource;
        Cust: Record Customer;
        Customer: Code[30];
        //  Notification1: Codeunit "Email Message";
        FileDirectory: Text;
        FileName: Text;
        Resource: Record Resource;
        FileName2: Text;
        ResourceAllocationTable: Record "Proposal Document Sub-Topic";
        Counter: Integer;
        FileDirectory1: Text;
        RallocationTable: Record "Proposal Document Sub-Topic";

    procedure InvitationEmailRes(ResourceAllocationTable: Record "Site Inspection Comment")
    begin
        // CompInfo.Get;
        // SMTPMailSet.Get;
        // objCustomer.Reset;//insert control to find a unique member
        // objCustomer.Get("User Category");
        // Customer := "User Category";
        // Notification1.CreateMessage('Commision For University Education', SMTPMailSet."Email Sender Address", objCustomer.Address, 'Selection on Accreditation',
        // 'Dear ' + objCustomer.Name + ',<BR><BR>' +
        // ' Your are Invited to take part in ' + UpperCase(ResourceAllocationTable."User Name") + '<BR>' + 'for the Workorder:<BR>' + UpperCase(RallocationTable.Description) +
        // '' + '<BR>' + '<BR>' + 'Kindly login to the Peer Reviewers portal sign the Conflict of Interest form', true);
        // //change address to email
        // Counter := Counter + 1;
        // Notification1.AppendToBody(
        // '<BR><BR>Kind Regards,' +
        // '<BR><BR>For any Information or questions, Please Contact' + '<BR>Information and Communication Department<BR>' +
        // CompInfo.Name + '<BR>' +
        // CompInfo.Address + '<BR>' +
        // CompInfo."Address 2" + '<BR>' +
        // CompInfo."Phone No." + '<BR>' +
        // CompInfo.City);
        // Notification1.AddBCC(SMTPMailSet."Email Sender Address");
        // Notification1.Send;
        // Message('The notifications successfully sent to %1', Rec.Observation);

    end;

    procedure CommisioningEmailRes(AllocationTable: Record "Site Inspection Comment")
    begin
        // CompInfo.Get;
        // SMTPMailSet.Get;
        // objCustomer.Reset;//insert control to find a unique member
        // objCustomer.Get("User Category");
        // Customer := "User Category";
        // Notification1.CreateMessage('Commision For University Education', SMTPMailSet."Email Sender Address", objCustomer.Address, 'Selection on Accreditation',
        // 'Dear ' + objCustomer.Name + ',<BR><BR>' +
        // ' Your involvement in ' + UpperCase(AllocationTable."User Name") + ' has been successfully processed.<BR>' +
        // '' + '<BR>' + '<BR>' + 'Attached find the relevant documents', true);
        // //change address to email
        // Counter := Counter + 1;
        // Notification1.AppendToBody(
        // '<BR><BR>Kind Regards,' +
        // '<BR><BR>For any Information or questions, Please Contact' + '<BR>Information and Communication Department<BR>' +
        // CompInfo.Name + '<BR>' +
        // CompInfo.Address + '<BR>' +
        // CompInfo."Address 2" + '<BR>' +
        // CompInfo."Phone No." + '<BR>' +
        // CompInfo.City);
        // FileDirectory := 'D:\Appointment Letter\';
        // FileName := 'Commisioning_Letter_' + Format(AllocationTable."User Name") + Customer + '.pdf';
        // FileDirectory1 := 'D:\Insitution Documents\';
        // // FileName1:='ConflictOfInterest_Accreditation.pdf';//ensure the name of the files are standard
        // FileName2 := 'Accreditation_File.pdf';
        // if FILE.Exists(FileDirectory + FileName) then
        //     FILE.Erase(FileDirectory + FileName);
        // Resource.SetRange("No.", Customer);
        // if Resource.FindSet then begin
        //     //Report.SaveAsPdf(51209, FileDirectory + FileName, Resource);//56231
        //     ResourceAllocationTable.Reset;
        //     ResourceAllocationTable.SetRange(Code, Published);
        //     if ResourceAllocationTable."Curriculum Verdict" = ResourceAllocationTable."curriculum verdict"::"0" then
        //         Notification1.AddAttachment(FileDirectory + FileName, FileName)
        //     else
        //         //  Notification1.AddAttachment(FileDirectory1+FileName1,FileName1);
        //         Notification1.AddAttachment(FileDirectory1 + FileName2, FileName2);
        //     Notification1.AddBCC(SMTPMailSet."Email Sender Address");
        //     Notification1.Send;
        //     //

        //     if FILE.Exists(FileDirectory + FileName) then
        //         FILE.Erase(FileDirectory + FileName);


        //     Message('The notification and Documents were successfully sent to %1', objCustomer.Address);
    end;


    //    end;
}

#pragma implicitwith restore

