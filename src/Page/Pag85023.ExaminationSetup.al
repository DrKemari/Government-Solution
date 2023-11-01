#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 85023 "Examination Setup"
{
    ApplicationArea = Basic;
    PageType = Card;
    SourceTable = "Examination Setup";
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Withdrawal Prod. Posting Group"; Rec."Withdrawal Prod. Posting Group")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Withdrawal Prod. Posting Group field.';
                }
                field("Withdrawal Journal Template"; Rec."Withdrawal Journal Template")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Withdrawal Journal Template field.';
                }
                field("Withdrawal Journal Batch"; Rec."Withdrawal Journal Batch")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Withdrawal Journal Batch field.';
                }
                field("Exemption Reversal Template"; Rec."Exemption Reversal Template")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Exemption Reversal Template field.';
                }
                field("Exemption Reversal Batch Name"; Rec."Exemption Reversal Batch Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Exemption Reversal Batch Name field.';
                }
                field("Booking Reversal Template"; Rec."Booking Reversal Template")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Booking Reversal Template field.';
                }
                field("Booking Reversal Batch Name"; Rec."Booking Reversal Batch Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Booking Reversal Batch Name field.';
                }
                field("Registration Reversal Template"; Rec."Registration Reversal Template")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Registration Reversal Template field.';
                }
                field("Regist  Reversal Batch Name"; Rec."Regist  Reversal Batch Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Regist  Reversal Batch Name field.';
                }
                field("Student Allocation Template"; Rec."Student Allocation Template")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Student Allocation Template field.';
                }
                field("Student Allocation Batch Name"; Rec."Student Allocation Batch Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Student Allocation Batch Name field.';
                }
                field("Withdrawal Bus. Posting Group"; Rec."Withdrawal Bus. Posting Group")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Withdrawal Bus. Posting Group field.';
                }
                field("Withdrawal Paying Bank"; Rec."Withdrawal Paying Bank")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Withdrawal Paying Bank field.';
                }
                field("Registration Sender Email"; Rec."Registration Sender Email")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Registration Sender Email field.';
                }
                field("Registration Contact Email"; Rec."Registration Contact Email")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Registration Contact Email field.';
                }
                field("Appointment Sender Email"; Rec."Appointment Sender Email")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Appointment Sender Email field.';
                }
                field("Examination Path"; Rec."Examination Path")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Examination Path field.';
                }
                field("Disability Discount %"; Rec."Disability Discount %")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Disability Discount % field.';
                }
                field("Payment Instructions"; Rec."Payment Instructions")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Payment Instructions field.';
                }
                field("Payments Bank Code"; Rec."Payments Bank Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Payments Bank Code field.';
                }
                field("Default Payment Mode"; Rec."Default Payment Mode")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Default Payment Mode field.';
                }
                field("Auto-Posting"; Rec."Auto-Posting")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Auto-Posting field.';
                }
                field("Renewal Fee"; Rec."Renewal Fee")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Renewal Fee field.';
                }
                field("Exemption Authoriser"; Rec."Exemption Authoriser")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Exemption Authoriser field.';
                }
                field("Timetable Issuer"; Rec."Timetable Issuer")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Timetable Issuer field.';
                }
                field("Re-Activation Fee"; Rec."Re-Activation Fee")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Re-Activation Fee field.';
                }
                field("Equity Bank"; Rec."Equity Bank")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Equity Bank field.';
                }
                field("Coop Bank"; Rec."Coop Bank")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Coop Bank field.';
                }
                field("KCB Bank"; Rec."KCB Bank")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the KCB Bank field.';
                }
                field("KCB Bank USD"; Rec."KCB Bank USD")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the KCB Bank USD field.';
                }
                field("National Bank"; Rec."National Bank")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the National Bank field.';
                }
                field("Bank Import Template"; Rec."Bank Import Template")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Bank Import Template field.';
                }
                field("Bank Import Batch Name"; Rec."Bank Import Batch Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Bank Import Batch Name field.';
                }
                field("Unnalocated Account"; Rec."Unnalocated Account")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Unnalocated Account field.';
                }
                field("Student Portal User"; Rec."Student Portal User")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Student Portal User field.';
                }
                field("Student Module EMail BCC"; Rec."Student Module EMail BCC")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Student Module EMail BCC field.';
                }
                field(Picture; Rec.Picture)
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the picture that has been set up for the company, such as a company logo.';

                    trigger OnValidate()
                    begin
                        CurrPage.SaveRecord;
                    end;
                }
                field("Allow Booking With No Photo"; Rec."Allow Booking With No Photo")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Allow Booking With No Photo field.';
                }
                field("Printing No. Factor"; Rec."Printing No. Factor")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Printing No. Factor field.';
                }
                field("Lock Updating of Photos"; Rec."Lock Updating of Photos")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Lock Updating of Photos field.';
                }
                field("Default Examination Sitting"; Rec."Default Examination Sitting")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Default Examination Sitting field.';
                }
                field("Default Marking Center"; Rec."Default Marking Center")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Default Marking Center field.';
                }
                field("Default Confirmation Fees"; Rec."Default Confirmation Fees")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Default Confirmation Fees field.';
                }
                field("Default Confirmation Account"; Rec."Default Confirmation Account")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Default Confirmation Account field.';
                }
                field("Exam Remarking period"; Rec."Exam Remarking period")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Exam Remarking period field.';
                }
                field("Enable Strict Document Reuse"; Rec."Enable Strict Document Reuse")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Enable Strict Document Reuse field.';
                }
                field("Default Dummy Amount"; Rec."Default Dummy Amount")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Default Dummy Amount field.';
                }
                field("Default Lunch Amount"; Rec."Default Lunch Amount")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Default Lunch Amount field.';
                }
                field("Default Script Amount"; Rec."Default Script Amount")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Default Script Amount field.';
                }
                field("Default Solution Amount"; Rec."Default Solution Amount")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Default Solution Amount field.';
                }
                field("Certificate Collect Resource"; Rec."Certificate Collect Resource")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Certificate Collection Resource field.';
                }
            }
            group(Numbering)
            {
                field("Appointment Nos"; Rec."Appointment Nos")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Appointment Nos field.';
                }
                field("Application Nos."; Rec."Application Nos.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Application Nos. field.';
                }
                field("Student Nos."; Rec."Student Nos.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Student Nos. field.';
                }
                field("Institution No.s"; Rec."Institution No.s")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Institution No.s field.';
                }
                field("Examination Booking Nos."; Rec."Examination Booking Nos.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Examination Booking Nos. field.';
                }
                field("Bulk Application Nos."; Rec."Bulk Application Nos.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Bulk Application Nos. field.';
                }
                field("Bulk Examination Booking Nos."; Rec."Bulk Examination Booking Nos.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Bulk Examination Booking Nos. field.';
                }
                field("Allocation Nos."; Rec."Allocation Nos.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Allocation Nos. field.';
                }
                field("RE-Allocation Nos."; Rec."RE-Allocation Nos.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the RE-Allocation Nos. field.';
                }
                field("Cancellation Nos."; Rec."Cancellation Nos.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Cancellation Nos. field.';
                }
                field("Defferment Nos."; Rec."Defferment Nos.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Defferment Nos. field.';
                }
                field("Exemption Nos."; Rec."Exemption Nos.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Exemption Nos. field.';
                }
                field("Withdrawal Nos."; Rec."Withdrawal Nos.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Withdrawal Nos. field.';
                }
                field("Withdrawa Vendor Nos."; Rec."Withdrawa Vendor Nos.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Withdrawa Vendor Nos. field.';
                }
                field("BoQ Template Nos."; Rec."BoQ Template Nos.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the BoQ Template Nos. field.';
                }
                field("Examination Planner Nos."; Rec."Examination Planner Nos.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Examination Planner Nos. field.';
                }
                field("Staff Appointment Nos."; Rec."Staff Appointment Nos.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Staff Appointment Nos. field.';
                }
                field("Staff Template Nos."; Rec."Staff Template Nos.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Staff Template Nos. field.';
                }
                field("Staff Termination Nos."; Rec."Staff Termination Nos.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Staff Termination Nos. field.';
                }
                field("Timetable Planner Nos."; Rec."Timetable Planner Nos.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Timetable Planner Nos. field.';
                }
                field("Marksheet Header Nos."; Rec."Marksheet Header Nos.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Marksheet Header Nos. field.';
                }
                field("Internal Exam Appointment Nos."; Rec."Internal Exam Appointment Nos.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Internal Exam Appointment Nos. field.';
                }
                field("External Exam Appointment Nos."; Rec."External Exam Appointment Nos.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the External Exam Appointment Nos. field.';
                }
                field("Dispatch Header Nos."; Rec."Dispatch Header Nos.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Dispatch Header Nos. field.';
                }
                field("Disciplinary Nos."; Rec."Disciplinary Nos.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Disciplinary Nos. field.';
                }
                field("Reinstatement  Nos."; Rec."Reinstatement  Nos.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Reinstatement  Nos. field.';
                }
                field("Prize Award Nos."; Rec."Prize Award Nos.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Prize Award Nos. field.';
                }
                field("Collection Nos."; Rec."Collection Nos.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Collection Nos. field.';
                }
                field("Remarking Nos."; Rec."Remarking Nos.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Remarking Nos. field.';
                }
                field("Renewal Nos."; Rec."Renewal Nos.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Renewal Nos. field.';
                }
                field("Payment Application Nos."; Rec."Payment Application Nos.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Payment Application Nos. field.';
                }
                field("Re-Activation Nos."; Rec."Re-Activation Nos.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Re-Activation Nos. field.';
                }
                field("Confirmation Application Nos."; Rec."Confirmation Application Nos.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Confirmation Application Nos. field.';
                }
                field("Script Receipt Nos"; Rec."Script Receipt Nos")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Script Receipt Nos field.';
                }
                field("Markers Claim Voucher Nos"; Rec."Markers Claim Voucher Nos")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Markers Claim Voucher Nos field.';
                }
                field("Checkers Work Ticket Nos"; Rec."Checkers Work Ticket Nos")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Checkers Work Ticket Nos field.';
                }
                field("Sampling Voucher Nos"; Rec."Sampling Voucher Nos")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Sampling Voucher Nos field.';
                }
                field("Script Dispatch Nos"; Rec."Script Dispatch Nos")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Script Dispatch Nos field.';
                }
                field("Marker Tally  Nos"; Rec."Marker Tally  Nos")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Marker Tally  Nos field.';
                }
                field("Marker Attendance Nos"; Rec."Marker Attendance Nos")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Marker Attendance Nos field.';
                }
                field("Checker Attendance Reg  Nos."; Rec."Checker Attendance Reg  Nos.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Checker Attendance Reg  Nos. field.';
                }
                field("Script Re-Allocation Vouch Nos"; Rec."Script Re-Allocation Vouch Nos")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Script Re-Allocation Vouch Nos field.';
                }
                field("Marker Center Checklist  Nos"; Rec."Marker Center Checklist  Nos")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Marker Center Checklist  Nos field.';
                }
                field("CRM Case Nos."; Rec."CRM Case Nos.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the CRM Case Nos. field.';
                }
            }
            group("Quality Assurance")
            {
                field("Assurance Report Nos."; Rec."Assurance Report Nos.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Assurance Report Nos. field.';
                }
                field("Assurance Department Report"; Rec."Assurance Department Report")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Assurance Department Report field.';
                }
                field("Assurance Plan Nos."; Rec."Assurance Plan Nos.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Assurance Plan Nos. field.';
                }
            }
            group("Curriculum Development")
            {
                field("Default Bill To Customer"; Rec."Default Bill To Customer")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Default Bill To Customer field.';
                }
                field("TaskForce Nos."; Rec."TaskForce Nos.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the TaskForce Nos. field.';
                }
                field("External TaskForce Nos."; Rec."External TaskForce Nos.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the External TaskForce Nos. field.';
                }
                field("Draft Syllabus Review Nos."; Rec."Draft Syllabus Review Nos.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Draft Syllabus Review Nos. field.';
                }
                field("NewCurriculum Application Nos."; Rec."NewCurriculum Application Nos.")
                {
                    ApplicationArea = Basic;
                    Caption = 'New Curriculum Application Nos.';
                    ToolTip = 'Specifies the value of the New Curriculum Application Nos. field.';
                }
                field("Curriculum Application Nos."; Rec."Curriculum Application Nos.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Curriculum Application Nos. field.';
                }
                field("Draft Syllabus Nos."; Rec."Draft Syllabus Nos.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Draft Syllabus Nos. field.';
                }
                field("Syllabus Nos."; Rec."Syllabus Nos.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Syllabus Nos. field.';
                }
                field("TaskForce Template Nos."; Rec."TaskForce Template Nos.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the TaskForce Template Nos. field.';
                }
                field("EC Feedback Nos."; Rec."EC Feedback Nos.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the EC Feedback Nos. field.';
                }
                field("ETC Feedback Nos."; Rec."ETC Feedback Nos.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the ETC Feedback Nos. field.';
                }
                field("Board Feedback Nos."; Rec."Board Feedback Nos.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Board Feedback Nos. field.';
                }
                field("Stakeholder Feedback Nos."; Rec."Stakeholder Feedback Nos.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Stakeholder Feedback Nos. field.';
                }
                field("Consecutive Review  Nos."; Rec."Consecutive Review  Nos.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Consecutive Review  Nos. field.';
                }
            }
            group("Library Management")
            {
                field("Library SignUp Email"; Rec."Library SignUp Email")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Library SignUp Email field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

