#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 70195 "Prequalification Score Header"
{

    fields
    {
        field(1;"Code";Code[30])
        {
            DataClassification = ToBeClassified;
            Editable = false;

            trigger OnValidate()
            begin
                if Code<>'' then
                  begin

                    ProcurementSetup.Get;
                    ProcurementSetup.TestField("Prequalification Score Header");
                    NoMgt.TestManual(ProcurementSetup."Prequalification Score Header");
                     "No. Series":=''
                 end;
            end;
        }
        field(2;"Document Date";Date)
        {
            DataClassification = ToBeClassified;
            Editable = true;
        }
        field(3;"Prequalification Evaluation Te";Code[20])
        {
            Caption = 'Prequalification Evaluation Template ID';
            DataClassification = ToBeClassified;
            Description = 'Prequalification Evaluation Template ID';
            TableRelation = "Bid Scoring Template".Code where ("Template type"=const("Prequalification Scoring"));

            trigger OnValidate()
            begin
                Bidevaluationscore.Reset;
                if Bidevaluationscore.FindLast then
                LineNo:=Bidevaluationscore."Line No";

                Bidevaluationscore.Reset;
                Bidevaluationscore.SetRange("Rating Template ID","Prequalification Evaluation Te");
                Bidevaluationscore.SetRange("Evaluation Voucher ID",Code);
                if Bidevaluationscore.FindSet then begin
                  Bidevaluationscore.DeleteAll;

                  end;

                BidEvaluationCriteria.Reset;
                BidEvaluationCriteria.SetRange("Template ID","Prequalification Evaluation Te");
                BidEvaluationCriteria.SetRange("Document No",Code);
                if BidEvaluationCriteria.FindSet then begin
                  BidEvaluationCriteria.DeleteAll;
                  end;

                BidEvalScore.Reset;
                BidEvalScore.SetRange("Template ID","Prequalification Evaluation Te");
                BidEvalScore.SetRange("Document No",Code);
                if BidEvalScore.FindSet then begin
                  BidEvalScore.DeleteAll;
                  end;

                BidSCoreGuide.Reset;
                BidSCoreGuide.SetRange("Template ID","Prequalification Evaluation Te");
                BidSCoreGuide.SetRange("Evaluation Type",BidSCoreGuide."evaluation type"::"Preliminary Evaluation");
                if BidSCoreGuide.FindSet then begin
                  repeat
                  Bidevaluationscore.Init;
                  Bidevaluationscore."Evaluation Voucher ID":=Code;
                  Bidevaluationscore."Line No":=LineNo+1;;
                  //Bidevaluationscore."Bid No.":="Bid No.";
                  //Bidevaluationscore."Vendor No.":="Vendor No.";
                  Bidevaluationscore."Criteria Group":=BidSCoreGuide."Criteria Group ID";
                  Bidevaluationscore."Checklist ID":=BidSCoreGuide."Requirement ID";
                  Bidevaluationscore."Evaluation Requirement":=BidSCoreGuide."Evaluation Requirement";
                  Bidevaluationscore."Rating Type":=BidSCoreGuide."Rating Type";
                  Bidevaluationscore."Target Qty":=BidSCoreGuide."Target Qty";
                  //Bidevaluationscore."Target Value":=BidSCoreGuide."Target Value";
                  //Bidevaluationscore."Unit of Measure":=BidSCoreGuide."Unit of Measure";
                  //Bidevaluationscore."Response Value":=Bid
                  //Bidevaluationscore."Bid Response Actual Qty":=BidSCoreGuide.
                  //Bidevaluationscore."Score %":=
                  Bidevaluationscore."Assigned Weight %":=BidSCoreGuide."Assigned Weight %";
                  //Bidevaluationscore."Weighted Line Score":=BidSCoreGuide.
                  //Bidevaluationscore."Equipment Type":=BidSCoreGuide."Equipment Type";
                  Bidevaluationscore."Desired Perfomance Direction":=BidSCoreGuide."Desired Perfomance Direction";
                  Bidevaluationscore."Rating Template ID":="Prequalification Evaluation Te";
                  Bidevaluationscore.Insert(true);
                  LineNo+=1;
                until BidSCoreGuide.Next=0;
                end;

                //add bid evaluation criteria
                EvaluationCriteria.Reset;
                EvaluationCriteria.SetRange("Template ID","Prequalification Evaluation Te");
                //EvaluationCriteria.SETRANGE("Evaluation Type","Evaluation Type");
                if EvaluationCriteria.FindSet then begin
                  repeat
                    BidEvaluationCriteria.Init;
                    BidEvaluationCriteria."Template ID":=EvaluationCriteria."Template ID";
                    BidEvaluationCriteria."Criteria Group ID":=EvaluationCriteria."Criteria Group ID";
                    BidEvaluationCriteria."Document No":=Code;
                    BidEvaluationCriteria."Evaluation Type":=EvaluationCriteria."Evaluation Type";
                    BidEvaluationCriteria.Description:=EvaluationCriteria.Description;
                    BidEvaluationCriteria."Total Weight %":=EvaluationCriteria."Total Weight %";
                    BidEvaluationCriteria.Insert(true);
                    until EvaluationCriteria.Next=0;
                  end;

                //add Bid Evaluation Score Guide
                  BidScore.Reset;
                  BidScore.SetRange("Template ID","Prequalification Evaluation Te");
                  //BidScore.SETRANGE("Evaluation Type","Evaluation Type");
                  if BidScore.FindSet then begin
                    repeat
                    BidEvalScore.Init;
                    BidEvalScore."Template ID":=BidScore."Template ID";
                    BidEvalScore."Criteria Group ID":=BidScore."Criteria Group ID";
                    BidEvalScore."Requirement ID":=BidScore."Requirement ID";
                    BidEvalScore."Entry No":=BidScore."Entry No";
                    BidEvalScore."Response Value":=BidScore."Response Value";
                    BidEvalScore."Document No":=Code;
                    BidEvalScore."Target Qty":=BidScore."Target Qty";
                    BidEvalScore."Rating Type":=BidScore."Rating Type";
                    //BidEvalScore."Evaluation Type":=BidScore."Evaluation Type";
                    BidEvalScore."Desired Perfomance Direction":=BidScore."Desired Perfomance Direction";
                    BidEvalScore."Min Bid Value":=BidScore."Min Bid Value";
                    BidEvalScore."Max Bid Value":=BidScore."Max Bid Value";
                    BidEvalScore."Min Date Value":=BidScore."Min Date Value";
                    BidEvalScore."Max Date Value":=BidScore."Max Date Value";
                    BidEvalScore."Score %":=BidScore."Score %";
                    BidEvalScore.Insert(true);
                    until BidScore.Next=0;
                    end;
            end;
        }
        field(4;"Evaluation Lead";Code[20])
        {
            DataClassification = ToBeClassified;
            Description = 'Linked to Resource Table (To handle both staff and non-staff evaluation committee members)';
            TableRelation = Resource."No.";

            trigger OnValidate()
            var
                Resources: Record Resource;
            begin
                Resources.Get;
                Resources.SetRange("No.","Evaluation Lead");
                if Resources.FindSet then begin
                  "Evaluation Lead Name":=Resources.Name;

                  end;
            end;
        }
        field(5;"Evaluation Lead Name";Text[80])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(6;"Prequalification Response No.";Code[30])
        {
            DataClassification = ToBeClassified;
            Description = 'Prequalification Response No.';
            TableRelation = "RFI Response"."Document No." where ("Document Type"=const("IFP Response"),
                                                                 "Document Status"=const(Evaluation));

            trigger OnValidate()
            begin
                RFIResponse.Reset;
                RFIResponse.SetRange("Document No.","Prequalification Response No.");
                if RFIResponse.FindSet then begin
                  "Vendor No.":=RFIResponse."Vendor No.";
                  "Vendor Name":=RFIResponse."Vendor Name";
                  "IFP No.":=RFIResponse."RFI Document No.";
                  Description:=RFIResponse."Document No."+' Prequalification evaluation';
                  "Primary Responsibility Center":=RFIResponse.County;
                  end;
            end;
        }
        field(7;"Vendor No.";Code[30])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(8;"Vendor Name";Text[60])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(9;"IFP No.";Code[30])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(10;"Procurement Category";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "IFP Response Line"."Procurement Category" where ("Document Type"=const("IFP Response"),
                                                                              "Document No."=field("Prequalification Response No."));
        }
        field(11;"Category Name";Text[60])
        {
            CalcFormula = lookup("IFP Response Line"."Category Description" where ("Procurement Category"=field("Procurement Category")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(12;Description;Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(13;"Primary Responsibility Center";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center".Code;
        }
        field(14;"System Evaluation Score %";Decimal)
        {
            DataClassification = ToBeClassified;
            Description = 'The total percentage score that is assigned to this evaluation by the system (It is based on sum calcfield for the Score % field for each of the eva)';
            MaxValue = 100;
            MinValue = 0;
        }
        field(15;"Final Evaluation Score %";Decimal)
        {
            DataClassification = ToBeClassified;
            Description = 'The final percentage score that is assigned to this evaluation by the committee. This field shall by default be set to default value equal to the System Evaluation Score %. This score is posted to the IFP Response Line when the Close IFP function is executed.';
            MaxValue = 100;
            MinValue = 0;
        }
        field(16;"Final Evaluation Decision";Option)
        {
            DataClassification = ToBeClassified;
            Description = 'Final evaluation verdict by the Procurement function';
            OptionCaption = ',Pass,Fail';
            OptionMembers = ,Pass,Fail;
        }
        field(17;"Evaluation Committee Remarks";Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(18;"No. Series";Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(19;"Created By";Code[50])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(20;"Created Date";Date)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(21;"Created Time";Time)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
    }

    keys
    {
        key(Key1;"Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        if Code='' then begin

        ProcurementSetup.Get;
        ProcurementSetup.TestField("Prequalification Score Header");
        NoMgt.InitSeries(ProcurementSetup."Prequalification Score Header",xRec."No. Series",0D,Code,"No. Series");

        end;
        "Document Date":=Today;
        "Created By":=UserId;
        "Created Date":=Today;
        "Created Time":=Time;
    end;

    var
        ProcurementSetup: Record "Procurement Setup";
        NoMgt: Codeunit NoSeriesManagement;
        PostCode: Record "Post Code";
        Vend: Record Vendor;
        RFIResponse: Record "RFI Response";
        Bids: Record "Purchase Header";
        Bidevaluationscore: Record "Prequalification Score Line";
        BidSCoreGuide: Record "Bid Score Requirement";
        LineNo: Integer;
        BidScore: Record "Bid Score Guide";
        BidEvaluationCriteria: Record "Bid Evaluation Criteria Group";
        EvaluationCriteria: Record "Bid Score Criteria Group";
        BidEvalScore: Record "Bid Evaluation Score Guide";
        BidEvaluationregister: Record "Bid Evaluation Register";
        BidOpening: Record "Bid Opening Register";
}

