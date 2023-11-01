#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 85018 "Examination Setup"
{
    Caption = 'Examination Setup';

    fields
    {
        field(1; "Primary Key"; Code[10])
        {
            Caption = 'Primary Key';
        }
        field(2; "Appointment Nos"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(3; "Application Nos."; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(4; "Student Nos."; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(5; "Registration Sender Email"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(6; "Examination Booking Nos."; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(7; "Bulk Application Nos."; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(8; "Bulk Examination Booking Nos."; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(9; "RE-Allocation Nos."; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(10; "Allocation Nos."; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(11; "Exemption Nos."; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(12; "Withdrawal Nos."; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(13; "Withdrawa Vendor Nos."; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(14; "Withdrawal Prod. Posting Group"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Gen. Product Posting Group";
        }
        field(15; "Withdrawal Paying Bank"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Bank Account";
        }
        field(16; "Withdrawal Bus. Posting Group"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Gen. Business Posting Group";
        }
        field(17; "Withdrawal Journal Template"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Gen. Journal Template";
        }
        field(18; "Withdrawal Journal Batch"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Gen. Journal Batch".Name where("Journal Template Name" = field("Withdrawal Journal Template"));
        }
        field(19; "Institution No.s"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(20; "Defferment Nos."; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(21; "BoQ Template Nos."; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(22; "Examination Planner Nos."; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(23; "Staff Appointment Nos."; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(24; "Staff Template Nos."; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(25; "Appointment Sender Email"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(26; "Cancellation Nos."; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(27; "Staff Termination Nos."; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(28; "Timetable Planner Nos."; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(29; "Marksheet Header Nos."; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(30; "Examination Path"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(31; "Internal Exam Appointment Nos."; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(32; "External Exam Appointment Nos."; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(33; "Dispatch Header Nos."; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(34; "Disciplinary Nos."; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(35; "Reinstatement  Nos."; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(36; "Prize Award Nos."; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(37; "Collection Nos."; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(38; "Remarking Nos."; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(39; "Default Bill To Customer"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Customer;
        }
        field(40; "TaskForce Nos."; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(41; "Draft Syllabus Review Nos."; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(42; "NewCurriculum Application Nos."; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(43; "Curriculum Application Nos."; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(44; "Draft Syllabus Nos."; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(45; "Syllabus Nos."; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(46; "TaskForce Template Nos."; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(47; "EC Feedback Nos."; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(48; "ETC Feedback Nos."; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(49; "Board Feedback Nos."; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(50; "Stakeholder Feedback Nos."; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(51; "Renewal Nos."; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(52; "Re-Activation Nos."; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(53; "Renewal Fee"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(54; "Re-Activation Fee"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(55; "Renewal Resource"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Resource;
        }
        field(56; "Re-Activation Resource"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Resource;
        }
        field(57; "External TaskForce Nos."; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(58; "Consecutive Review  Nos."; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(59; "Library SignUp Email"; Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(60; "Confirmation Application Nos."; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(61; "Monitoring Center Nos."; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(62; "Monitoring Evaluation Nos."; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(63; "Registration Contact Email"; Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(64; "Resource Allocation Nos."; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(65; "Envelope Value"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(66; "Reminder Date"; DateFormula)
        {
            DataClassification = ToBeClassified;
        }
        field(67; "Disability Discount %"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(68; "Payment Instructions"; Text[700])
        {
            DataClassification = ToBeClassified;
        }
        field(69; "Payments Bank Code"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Bank Account" where(Type = filter(Bank));
        }
        field(70; "Auto-Posting"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(71; "Default Payment Mode"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Pay Mode";
        }
        field(72; "Exemption Authoriser"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "User Setup";
        }
        field(73; "Image File Path"; Text[150])
        {
            DataClassification = ToBeClassified;
        }
        field(74; "CRM Case Nos."; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(75; "Exam Results Nos."; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(76; "Payment Application Nos."; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(77; "Timetable Issuer"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "User Setup";
        }
        field(78; "Student Module EMail BCC"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(79; "Equity Bank"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Bank Account";
        }
        field(80; "Coop Bank"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Bank Account";
        }
        field(81; "KCB Bank"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Bank Account";
        }
        field(82; "National Bank"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Bank Account";
        }
        field(83; "Bank Import Template"; Code[20])
        {
            TableRelation = "Gen. Journal Template" where(Type = filter("Cash Receipts"));
        }
        field(84; "Bank Import Batch Name"; Code[20])
        {
            TableRelation = "Gen. Journal Batch".Name where("Journal Template Name" = field("Bank Import Template"));
        }
        field(85; "Unnalocated Account"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "G/L Account";
        }
        field(86; "Student Allocation Template"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Gen. Journal Template" where(Type = filter(General));
        }
        field(87; "Student Allocation Batch Name"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Gen. Journal Batch".Name where("Journal Template Name" = field("Student Allocation Template"));
        }
        field(88; "Student Portal User"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "User Setup";
        }
        field(89; "Student Receipt Nos"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(90; "Student Receipt Template"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Gen. Journal Template" where(Type = filter(General));
        }
        field(91; "Student Receipt Batch Name"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Gen. Journal Batch".Name where("Journal Template Name" = field("Student Receipt Template"));
        }
        field(92; "Postbank Code"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Bank Account";
        }
        field(93; Picture; Blob)
        {
            Caption = 'Picture';
            DataClassification = ToBeClassified;
            SubType = Bitmap;

            trigger OnValidate()
            begin
                //PictureUpdated := TRUE;
            end;
        }
        field(94; "Exemption Reversal Template"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Gen. Journal Template" where(Type = filter(General));
        }
        field(95; "Exemption Reversal Batch Name"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Gen. Journal Batch".Name where("Journal Template Name" = field("Student Allocation Template"));
        }
        field(96; "Booking Reversal Template"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Gen. Journal Template" where(Type = filter(General));
        }
        field(97; "Booking Reversal Batch Name"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Gen. Journal Batch".Name where("Journal Template Name" = field("Student Allocation Template"));
        }
        field(98; "KCB Bank USD"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Bank Account";
        }
        field(99; "Buffer Zone %"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(100; "Non-Buffer Zone %"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(101; "Neutral Buffer %"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(102; "Allow Booking With No Photo"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(103; "Lock Updating of Photos"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(104; "Printing No. Factor"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(105; "Registration Reversal Template"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Gen. Journal Template" where(Type = filter(General));
        }
        field(106; "Regist  Reversal Batch Name"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Gen. Journal Batch".Name where("Journal Template Name" = field("Student Allocation Template"));
        }
        field(107; "Enable Strict Document Reuse"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(108; "Default Examination Sitting"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Exam Sitting Cycle";
        }
        field(109; "Script Receipt Nos"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(110; "Default Marking Center"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Examination Centres";
        }
        field(111; "Exam Remarking period"; DateFormula)
        {
            DataClassification = ToBeClassified;
        }
        field(112; "Sampling Voucher Nos"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series".Code;
        }
        field(113; "Markers Claim Voucher Nos"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series".Code;
        }
        field(114; "Checkers Work Ticket Nos"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series".Code;
        }
        field(115; "Default Confirmation Fees"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(116; "Default Confirmation Account"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Customer."No.";
        }
        field(117; "Script Dispatch Nos"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(118; "Marker Attendance Nos"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(119; "Default Dummy Amount"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(120; "Default Lunch Amount"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(121; "Default Script Amount"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(122; "Inst. Confirmation Nos."; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(123; "Certificate Collect Resource"; Code[30])
        {
            Caption = 'Certificate Collection Resource';
            DataClassification = ToBeClassified;
            TableRelation = Resource;
        }
        field(124; "Checker Attendance Reg  Nos."; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(125; "Default Solution Amount"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(126; "Assurance Report Nos."; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(127; "Assurance Department Report"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(128; "Assurance Plan Nos."; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(129; "Script Re-Allocation Vouch Nos"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(130; "Marker Center Checklist  Nos"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(131; "Marker Tally  Nos"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }

        field(132; "Dummy Forms Nos"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(133; "Active Examination Marksheet"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Marksheet Header"."Document No." where("Document Type" = const(Marksheet));
        }
        field(134; "Staff Attendance Nos."; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(135; "Default Storage Amount"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(136; "KCB Consolidation Bank Account"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Bank Account";
        }
        field(137; "Marker Conflict of Interest No"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(138; "Marker Progress Forms  No"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(139; "Checker Evaluation Nos"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(140; "Checker Claim Nos"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(141; "Default Checking Amount"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(142; "Exam Administration Email"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(143; "Donor Nos"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(144; "Team Leader Reports Nos"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
    }

    keys
    {
        key(Key1; "Primary Key")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        Text001: label 'You cannot change %1 because there are %2.';
}

