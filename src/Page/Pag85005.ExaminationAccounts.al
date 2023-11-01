#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 85005 "Examination Accounts"
{
    ApplicationArea = Basic;
    CardPageID = "Exam Account Card";
    PageType = List;
    SourceTable = "Examination Account";
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Registration No."; Rec."Registration No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Registration No. field.';
                }
                field("Student Cust No."; Rec."Student Cust No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Student Cust No. field.';
                    Editable = true;
                }
                field("Registration Date"; Rec."Registration Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Registration Date field.';
                }
                field("Old Streamer"; Rec."Old Streamer")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Old Streamer field.';
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Name field.';
                }
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
                field(Surname; Rec.Surname)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Surname field.';
                }
                field("Course ID"; Rec."Course ID")
                {
                    ApplicationArea = Basic;
                    Caption = 'Examination ID';
                    ToolTip = 'Specifies the value of the Examination ID field.';
                }
                field("Course Description"; Rec."Course Description")
                {
                    ApplicationArea = Basic;
                    Caption = 'Examination';
                    ToolTip = 'Specifies the value of the Examination field.';
                }
                field(Blocked; Rec.Blocked)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Blocked field.';
                }
                field("Renewal Amount"; Rec."Renewal Amount")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Renewal Amount field.';
                }
                field("Re-Activation Amount"; Rec."Re-Activation Amount")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Re-Activation Amount field.';
                }
                field("Renewal Pending"; Rec."Renewal Pending")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Renewal Pending field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Status field.';
                }
                field("Status Remarks"; Rec."Status Remarks")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Status Remarks field.';
                }
                field("ID No."; Rec."ID No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the ID No. field.';
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Transfer Student")
            {
                ApplicationArea = Basic;
                Image = TransferReceipt;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                RunObject = Page "Transfer Course";
                RunPageLink = "Registration No." = field("Registration No.");
                ToolTip = 'Executes the Transfer Student action.';
                trigger OnAction()
                var
                    Examination: Codeunit Examination;
                    TXT001: label 'Transfer %1 to CIFA course';
                begin
                end;
            }
            action("Cancel Registration")
            {
                ApplicationArea = Basic;
                Image = Cancel;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ToolTip = 'Executes the Cancel Registration action.';
                trigger OnAction()
                var
                    Examination: Codeunit Examination;
                    TXT001: label 'Are you sure you want to cancel the registration and refund the amount?';
                    UserSetup: Record "User Setup";
                    TXT002: label 'You do not have sufficient rights to cancel a registration,consult the system administrator';
                    TXT003: label 'The registration no %1  has been cancelled succesfully';
                begin
                    if UserSetup.Get(UserId) then begin
                        if UserSetup."Student Mgmt Admin" = false then
                            Error(TXT002)
                        else begin
                            if Confirm(TXT001) = true then begin
                                Examination.ApplicationRefundRegistrationMoney(Rec);
                                Rec.Blocked := true;
                                Rec."Blocked Start Date" := Today;
                                Rec.Status := Rec.Status::Inactive;
                                Rec.Cancelled := true;
                                Rec."Cancelled By" := UserId;
                                Rec."Cancellation Date" := Today;
                                Rec."Last Date Modified" := Today;
                                Rec."Last Modified Date Time" := CurrentDatetime;
                                Rec.Modify(true);
                                Message(TXT003, Rec."Registration No.");
                            end
                        end
                    end
                end;
            }
            action("Certificate History")
            {
                ApplicationArea = Basic;
                Image = Certificate;
                Promoted = true;
                PromotedCategory = Category5;
                PromotedIsBig = true;
                RunObject = Page "Certificate Entry";
                RunPageLink = "Student Reg No." = field("Registration No.");
                ToolTip = 'Executes the Certificate History action.';
            }
            action(Remarks)
            {
                ApplicationArea = Basic;
                Image = ResetStatus;
                Promoted = true;
                PromotedCategory = Category6;
                PromotedIsBig = true;
                RunObject = Page Remarks;
                RunPageLink = "Registration No." = field("Registration No.");
                ToolTip = 'Executes the Remarks action.';
            }

            action("Update Student images")
            {
                ApplicationArea = Basic;
                Image = Cancel;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ToolTip = 'Executes the Cancel Registration action.';
                trigger OnAction()
                var
                    StudentProcessingHeader: Record "Student Processing Header";
                    fileName: Text;
                    importFile: File;
                    imageInStream: InStream;
                    imageID: Guid;
                    FileMgt: Codeunit "File Management";
                    //  TempBlob: Record TempBlob;
                    ServerFileNameTxt: Text;
                    ClientFileNameTxt: Text;
                    Imageoutsteram: OutStream;
                    MEDIA: File;
                    ExaminationSetup: Record "Examination Setup";
                    FileManagement: Codeunit "File Management";
                begin
                    Message('Initializing');
                    StudentProcessingHeader.Reset;
                    StudentProcessingHeader.SetRange(StudentProcessingHeader."Document Type", StudentProcessingHeader."Document Type"::Registration);
                    if StudentProcessingHeader.FindFirst then begin
                        repeat
                            fileName := '\\184.174.39.195\HRMPEBLive\Student Processing Header\' + StudentProcessingHeader."ID Number/Passport No." + '\' + StudentProcessingHeader."ID Number/Passport No." + '.jpg';
                            if FILE.Exists(fileName) then begin
                                importFile.Open(fileName);
                                importFile.CreateInstream(imageInStream);
                                imageID := StudentProcessingHeader.Image.ImportStream(imageInStream, 'student Profile photo ' + Format(StudentProcessingHeader."ID Number/Passport No."));
                                StudentProcessingHeader.Modify;
                                //MESSAGE(Text000, studentNo, imageID);
                                importFile.Close;
                            end;
                        //MESSAGE('SUCCESS' + studentNo);
                        until StudentProcessingHeader.Next < 1;
                    end;
                    Message('Done');

                end;
            }


            action("Update Booking Lines")
            {
                ApplicationArea = Basic;
                Image = ResetStatus;
                Promoted = true;
                PromotedCategory = Category6;
                PromotedIsBig = true;
                ToolTip = 'Updates Studsent ID.';
                trigger OnAction()
                var
                    myInt: Integer;
                    ExamAcc: Record "Examination Account";
                    ExamRes: Record "Exemption Entries";
                    Papers: Record Papers;
                    BulkProcessingLines: Record "Bulk Processing Lines";
                begin
                    ExamAcc.Reset();
                    ExamAcc.SetFilter("Registration No.", '<>%1', '');
                    if ExamAcc.FindSet() then begin
                        repeat
                            BulkProcessingLines.Reset();
                            BulkProcessingLines.SetRange("Registration No.", ExamAcc."Registration No.");
                            BulkProcessingLines.SetRange("Bulk Header No.", 'BK00038');
                            if BulkProcessingLines.FindSet() then begin
                                repeat
                                    BulkProcessingLines."Student No." := ExamAcc."Student Cust No.";
                                    BulkProcessingLines."ID Number" := ExamAcc."ID No.";
                                    BulkProcessingLines."Email" := ExamAcc.Email;
                                    BulkProcessingLines."First Name" := ExamAcc."First Name";
                                    BulkProcessingLines."Middle Name" := ExamAcc."Middle Name";
                                    BulkProcessingLines.Surname := ExamAcc.Surname;
                                    BulkProcessingLines."Student Name" := ExamAcc.Name;
                                    BulkProcessingLines.Gender := ExamAcc.Gender;
                                    BulkProcessingLines."Examination Project Code" := 'JUNE2023';
                                    BulkProcessingLines."Examination Project Name" := '2023 JUNE';
                                    BulkProcessingLines."Examination Cyce" := 'JUNE2023';
                                    // IF BulkProcessingLines."Course ID" = '' then begin
                                    //     BulkProcessingLines."Course ID" := 'RCHRP';
                                    //     BulkProcessingLines."Course Description" := 'CERTIFIED HUMAN RESOURCE PROFESSIONALS';
                                    // end;

                                    Papers.Reset();
                                    Papers.SetRange(Code, BulkProcessingLines.Paper);
                                    if Papers.FindSet() then
                                        BulkProcessingLines.Part := Papers.Level;
                                    BulkProcessingLines.Description := Papers.Description;
                                    BulkProcessingLines.Validate(Paper);
                                    BulkProcessingLines.Modify(true);
                                until BulkProcessingLines.Next = 0;

                            end;

                        until ExamAcc.Next = 0;

                    end;

                    Message('Done');
                end;
            }

            //posted institution booking
            // action("Clear Posted ")
            // {
            //     ApplicationArea = Basic;
            //     Image = ResetStatus;
            //     Promoted = true;
            //     PromotedCategory = Category6;
            //     PromotedIsBig = true;
            //     ToolTip = 'Updates Studsent ID.';
            //     trigger OnAction()
            //     var
            //         myInt: Integer;
            //         ExamAcc: Record "Examination Account";
            //         ExamRes: Record "Exemption Entries";
            //         Papers: Record Papers;
            //         BulkProcessingLines: Record "Bulk Processing Lines";
            //     begin
            //         ExamAcc.Reset();
            //         ExamAcc.SetFilter("Registration No.", '<>%1', '');
            //         if ExamAcc.FindSet() then begin
            //             repeat
            //                 BulkProcessingLines.Reset();
            //                 BulkProcessingLines.SetRange("Registration No.", ExamAcc."Registration No.");
            //                 if BulkProcessingLines.FindSet() then begin
            //                     repeat
            //                         BulkProcessingLines."Student No." := ExamAcc."Student Cust No.";
            //                         BulkProcessingLines."ID Number" := ExamAcc."ID No.";
            //                         BulkProcessingLines."Email" := ExamAcc.Email;
            //                         BulkProcessingLines."First Name" := ExamAcc."First Name";
            //                         BulkProcessingLines."Middle Name" := ExamAcc."Middle Name";
            //                         BulkProcessingLines.Surname := ExamAcc.Surname;
            //                         BulkProcessingLines."Student Name" := ExamAcc.Name;
            //                         BulkProcessingLines.Gender := ExamAcc.Gender;
            //                         BulkProcessingLines."Examination Project Code" := 'JUNE2023';
            //                         BulkProcessingLines."Examination Project Name" := '2023 JUNE';
            //                         BulkProcessingLines."Examination Cyce" := 'JUNE2023';
            //                         Papers.Reset();
            //                         Papers.SetRange(Code, BulkProcessingLines.Paper);
            //                         if Papers.FindSet() then
            //                             BulkProcessingLines.Part := Papers.Level;
            //                         BulkProcessingLines.Description := Papers.Description;
            //                         BulkProcessingLines.Validate(Paper);
            //                         BulkProcessingLines.Modify(true);
            //                     until BulkProcessingLines.Next = 0;

            //                 end;

            //             until ExamAcc.Next = 0;

            //         end;

            //         Message('Done');
            //     end;
            // }
            action("Update Booking Entries")
            {
                ApplicationArea = Basic;
                Image = ResetStatus;
                Promoted = true;
                PromotedCategory = Category6;
                PromotedIsBig = true;
                ToolTip = 'Updates Studsent ID.';
                trigger OnAction()
                var
                    myInt: Integer;
                    ExamAcc: Record "Examination Account";
                    ExamRes: Record "Exemption Entries";
                    Papers: Record Papers;
                    ExamBookEntries: Record "Exam Booking Entries";
                    BulkProcessingLines: Record "Bulk Processing Lines";
                begin
                    // ExamBookEntries.Reset();
                    //ExamBookEntries.SetFilter(Paper, '<>%1', '');
                    //if ExamBookEntries.FindSet() then begin
                    //repeat
                    ExamBookEntries.Reset();
                    ExamBookEntries.SetFilter(Paper, '<>%1', '');
                    if ExamBookEntries.FindSet() then begin
                        repeat
                            Papers.Reset();
                            Papers.SetRange(Code, ExamBookEntries.Paper);
                            if Papers.FindFirst() then
                                ExamBookEntries.Description := Papers.Description;
                            ExamBookEntries.Modify(true);
                        //ExamBookEntries.Validate(Paper);
                        //     ExamBookEntries.Reset();
                        //     Papers.SetRange(Code, BulkProcessingLines.Paper);
                        //     if Papers.FindSet() then
                        //         BulkProcessingLines.Part := Papers.Level;
                        //     BulkProcessingLines.Description := Papers.Description;
                        //     BulkProcessingLines.Validate(Paper);
                        //     BulkProcessingLines.Modify(true);
                        until ExamBookEntries.Next = 0;

                    end;

                    //until ExamBookEntries.Next = 0;

                    //end;

                    Message('Done');
                end;
            }

            // action("Student Result Name Details")
            // {
            //     ApplicationArea = Basic;
            //     Image = ResetStatus;
            //     Promoted = true;
            //     PromotedCategory = Category6;
            //     PromotedIsBig = true;
            //     ToolTip = 'Student Result Details.';
            //     trigger OnAction()
            //     var
            //         myInt: Integer;
            //         Papers: Record Papers;
            //         ExamAcc: Record "Examination Account";
            //         ExamRes: Record "Examination Results";
            //     begin
            //         ExamAcc.Reset();
            //         ExamAcc.SetFilter("Registration No.", '<>%1', '');
            //         if ExamAcc.FindSet() then begin
            //             repeat

            //                 ExamAcc.Name := ExamAcc."First Name" + ' ' + ExamAcc."Middle Name" + ' ' + ExamAcc.Surname;
            //                 // ExamRes."National ID No." := ExamAcc."ID No.";
            //                 // if ExamRes.Mark = 0 then begin
            //                 //     ExamRes.Grade := '**NS**';
            //                 // end;
            //                 ExamAcc.Modify(true);


            //             until ExamAcc.Next = 0;

            //         end;

            //         Message('Done');
            //     end;
            // }
            // action("Student name on Result Details")
            // {
            //     ApplicationArea = Basic;
            //     Image = ResetStatus;
            //     Promoted = true;
            //     PromotedCategory = Category6;
            //     PromotedIsBig = true;
            //     ToolTip = 'Student Result Details.';
            //     trigger OnAction()
            //     var
            //         myInt: Integer;
            //         Papers: Record Papers;
            //         ExamAcc: Record "Examination Account";
            //         ExamRes: Record "Examination Results";
            //     begin
            //         ExamAcc.Reset();
            //         ExamAcc.SetFilter("Registration No.", '<>%1', '');
            //         if ExamAcc.FindSet() then begin
            //             repeat
            //                 ExamRes.Reset();
            //                 ExamRes.SetRange("Student Reg No.", ExamAcc."Registration No.");
            //                 if ExamRes.FindSet() then begin
            //                     repeat
            //                         ExamRes."Student Name" := ExamAcc."First Name" + ' ' + ExamAcc."Middle Name" + ' ' + ExamAcc.Surname;
            //                         // ExamRes."National ID No." := ExamAcc."ID No.";
            //                         // if ExamRes.Mark = 0 then begin
            //                         //     ExamRes.Grade := '**NS**';
            //                         // end;
            //                         ExamRes.Modify(true);
            //                     until ExamRes.Next = 0;

            //                 end;

            //             until ExamAcc.Next = 0;

            //         end;

            //         Message('Done');
            //     end;
            // }
            // action("Update Student Exemption Details")
            // {
            //     ApplicationArea = Basic;
            //     Image = ResetStatus;
            //     Promoted = true;
            //     PromotedCategory = Category6;
            //     PromotedIsBig = true;
            //     ToolTip = 'Updates Studsent ID.';
            //     trigger OnAction()
            //     var
            //         myInt: Integer;
            //         ExamAcc: Record "Examination Account";
            //         ExamRes: Record "Exemption Entries";
            //         Papers: Record Papers;
            //     begin
            //         ExamAcc.Reset();
            //         ExamAcc.SetFilter("Registration No.", '<>%1', '');
            //         if ExamAcc.FindSet() then begin
            //             repeat
            //                 ExamRes.Reset();
            //                 ExamRes.SetRange("Stud. Reg. No", ExamAcc."Registration No.");
            //                 if ExamRes.FindSet() then begin
            //                     repeat
            //                         ExamRes."Stud. Cust No." := ExamAcc."Student Cust No.";
            //                         Papers.Reset();
            //                         Papers.SetRange(Code, ExamRes."No.");
            //                         if Papers.FindSet() then
            //                             ExamRes.Name := Papers.Description;
            //                         ExamRes.Modify(true);
            //                     until ExamRes.Next = 0;

            //                 end;

            //             until ExamAcc.Next = 0;

            //         end;

            //         Message('Done');
            //     end;
            // }
            // action("Student Result Details")
            // {
            //     ApplicationArea = Basic;
            //     Image = ResetStatus;
            //     Promoted = true;
            //     PromotedCategory = Category6;
            //     PromotedIsBig = true;
            //     ToolTip = 'Student Result Details.';
            //     trigger OnAction()
            //     var
            //         myInt: Integer;
            //         Papers: Record Papers;
            //         ExamAcc: Record "Examination Account";
            //         ExamRes: Record "Examination Results";
            //     begin
            //         ExamAcc.Reset();
            //         ExamAcc.SetFilter("Registration No.", '<>%1', '');
            //         if ExamAcc.FindSet() then begin
            //             repeat
            //                 ExamRes.Reset();
            //                 ExamRes.SetRange("Student Reg No.", ExamAcc."Registration No.");
            //                 if ExamRes.FindSet() then begin
            //                     repeat
            //                         ExamRes."National ID No." := ExamAcc."ID No.";
            //                         ExamRes.Modify(true);
            //                     until ExamRes.Next = 0;

            //                 end;

            //             until ExamAcc.Next = 0;

            //         end;

            //         Message('Done');
            //     end;
            // }
            action("Examination Accounts")
            {
                ApplicationArea = Basic;
                Image = Accounts;
                Promoted = true;
                PromotedCategory = Category6;
                PromotedIsBig = true;
                RunObject = Page "Examination Accounts";
                RunPageLink = "Student Cust No." = field("Student Cust No.");
                ToolTip = 'Executes the Examination Accounts action.';
            }
            action("Examination Booking Entries")
            {
                ApplicationArea = Basic;
                Image = Statistics;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedIsBig = true;
                RunObject = Page "Exam Booking Entries";
                RunPageLink = "Student Reg No." = field("Registration No.");
                ToolTip = 'Executes the Examination Booking Entries action.';
            }
            action("Exemption Entries")
            {
                ApplicationArea = Basic;
                Image = RemoveLine;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedIsBig = true;
                RunObject = Page "Exemption Entries";
                RunPageLink = "Stud. Reg. No" = field("Registration No.");
                ToolTip = 'Executes the Exemption Entries action.';
            }
            action("Defered Entries")
            {
                ApplicationArea = Basic;
                Image = WIPEntries;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedIsBig = true;
                RunObject = Page "Exam Defered Entries";
                RunPageLink = "Student Reg No." = field("Registration No.");
                ToolTip = 'Executes the Defered Entries action.';
            }
            action("Withdrawn Entries")
            {
                ApplicationArea = Basic;
                Image = CancelAllLines;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedIsBig = true;
                RunObject = Page "Exam Withdrawn Entries";
                RunPageLink = "Student Reg No." = field("Registration No.");
                ToolTip = 'Executes the Withdrawn Entries action.';
            }
            action("Student Receipts")
            {
                ApplicationArea = Basic;
                Image = ReceivableBill;
                Promoted = true;
                PromotedCategory = Category5;
                PromotedIsBig = true;
                RunObject = Page "Processed Student Details";
                RunPageLink = "Student No." = field("Student Cust No.");
                ToolTip = 'Executes the Student Receipts action.';
            }
            action("Send Details")
            {
                ApplicationArea = Basic;
                ToolTip = 'Executes the Send Details action.';
                trigger OnAction()
                var
                    Examination: Codeunit Examination;
                    Studentmanagement: Codeunit "Student management";
                    DynasoftPortalUser: Record "Dynasoft Portal User";
                begin
                end;
            }
            action("Examination History")
            {
                ApplicationArea = Basic;
                Image = History;
                Promoted = true;
                PromotedCategory = Category5;
                RunObject = Page "Examination History";
                RunPageLink = "Student Reg No." = field("Registration No.");
                ToolTip = 'Executes the Examination History action.';
                trigger OnAction()
                var
                    Examination: Codeunit Examination;
                    Studentmanagement: Codeunit "Student management";
                    DynasoftPortalUser: Record "Dynasoft Portal User";
                begin
                end;
            }
        }
        area(reporting)
        {
            action("Student Profile")
            {
                ApplicationArea = Basic;
                Image = "Report";
                Promoted = false;
                ToolTip = 'Executes the Student Profile action.';
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = "Report";
                //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
                //PromotedIsBig = true;

                trigger OnAction()
                begin
                    Customer.Reset;
                    Customer.SetRange("No.", Rec."Student Cust No.");
                    if Customer.FindFirst then begin
                        Report.Run(85101, true, false, Customer);
                    end
                end;
            }
        }
    }

    var
        Course: Code[30];
        Customer: Record Customer;
}

#pragma implicitwith restore

