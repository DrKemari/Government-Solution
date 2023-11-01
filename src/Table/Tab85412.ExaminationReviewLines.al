#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 85412 "Examination Review Lines"
{

    fields
    {
        field(1; "Document No."; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(2; "Line No."; Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(3; "Examination Sitting"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Exam Sitting Cycle";
        }
        field(4; "Question No."; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(5; "Topic Code"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Paper Topic Setup"."Topic Code" where("Paper Code" = field("Paper Code"));

            trigger OnValidate()
            var
                PaperTopicArea: Record "Paper Topic Area";
            begin
                PaperTopicArea.Reset;
                PaperTopicArea.SetRange(Code, "Topic Code");
                if PaperTopicArea.FindFirst then begin
                    "Topic Name" := PaperTopicArea.Description;
                end;

                if Rec."Topic Code" <> '' then begin
                    SetterHeader.Reset;
                    SetterHeader.SetRange("Document No.", "Document No.");
                    SetterHeader.SetRange("Document Type", SetterHeader."document type"::"Setter Specification");
                    if SetterHeader.FindFirst then begin
                        SetterTopics.Reset;
                        SetterTopics.SetRange("Document No.", "Document No.");
                        SetterTopics.SetRange("Topic Code", "Topic Code");
                        if not SetterTopics.FindSet then begin
                            SetterTopics2.Init;
                            SetterTopics2."Document No." := "Document No.";
                            SetterTopics3.Reset;
                            SetterTopics3.SetCurrentkey("Line No.");
                            if SetterTopics3.FindLast then
                                SetterTopics2."Line No." := SetterTopics3."Line No." + 1;
                            ;
                            SetterTopics2."Topic Code" := "Topic Code";
                            SetterTopics2."Topic Name" := PaperTopicArea.Description;
                            SetterTopics2.Insert(true);

                        end;

                    end;
                    //ReviewVoucher
                    ReviewVoucher.Reset;
                    ReviewVoucher.SetRange("Document No.", "Document No.");
                    ReviewVoucher.SetRange("Document Type", ReviewVoucher."document type"::Moderator);
                    if ReviewVoucher.FindFirst then begin
                        SetterTopics.Reset;
                        SetterTopics.SetRange("Document No.", "Document No.");
                        SetterTopics.SetRange("Topic Code", "Topic Code");
                        if not SetterTopics.FindFirst then begin
                            SetterTopics2.Init;
                            SetterTopics2."Document No." := "Document No.";
                            SetterTopics4.Reset;
                            SetterTopics4.SetCurrentkey("Line No.");
                            if SetterTopics4.FindLast then begin
                                SetterTopics2."Line No." := SetterTopics4."Line No." + 1;
                            end;
                            SetterTopics2."Topic Code" := "Topic Code";
                            SetterTopics2."Topic Name" := PaperTopicArea.Description;
                            SetterTopics2.Insert(true);

                        end;

                    end;
                end;
                //ReviewVoucher

                // IF xRec<>'' THEN BEGIN
                //  SetterTopi.RESET;
                //  SetterTopi.SETRANGE("Document No.","Document No.");
                //  SetterTopi.SETRANGE()
                //
                //
                // END;
            end;
        }
        field(6; "Topic Name"; Text[100])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(7; References; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(8; "Knowledge and Comprehension"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(9; "Application and Analysis"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(10; "Evaluation and Creativity"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(11; Comments; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(12; "Setter Code"; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = Resource;

            trigger OnValidate()
            var
                Resource: Record Resource;
            begin
                Resource.Reset;
                Resource.SetRange("No.", "Setter Code");
                if Resource.FindFirst then begin
                    "Setter Name" := Resource.Name;

                end
            end;
        }
        field(13; "Setter Name"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(14; "Setter Total Marks"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(15; "Action Taken"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(16; "Topic 2 Code"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Paper Topic Setup"."Topic Code" where("Paper Code" = field("Paper Code"));

            trigger OnValidate()
            var
                PaperTopicArea: Record "Paper Topic Area";
            begin
                PaperTopicArea.Reset;
                PaperTopicArea.SetRange(Code, "Topic 2 Code");
                if PaperTopicArea.FindFirst then begin
                    "Topic 2 Name" := PaperTopicArea.Description;
                end;
                if Rec."Topic 2 Code" <> '' then begin
                    SetterHeader.Reset;
                    SetterHeader.SetRange("Document No.", "Document No.");
                    SetterHeader.SetRange("Document Type", SetterHeader."document type"::"Setter Specification");
                    if SetterHeader.FindFirst then begin
                        SetterTopics.Reset;
                        SetterTopics.SetRange("Document No.", "Document No.");
                        SetterTopics.SetRange("Topic Code", "Topic 2 Code");
                        if not SetterTopics.FindSet then begin
                            SetterTopics2.Init;
                            SetterTopics2."Document No." := "Document No.";
                            SetterTopics3.Reset;

                            SetterTopics3.SetCurrentkey("Line No.");
                            if SetterTopics3.FindLast then
                                SetterTopics2."Line No." := SetterTopics3."Line No." + 1;
                            ;
                            SetterTopics2."Topic Code" := "Topic 2 Code";
                            SetterTopics2."Topic Name" := PaperTopicArea.Description;
                            SetterTopics2.Insert(true);

                        end;

                    end;
                    //ReviewVoucher
                    ReviewVoucher.Reset;
                    ReviewVoucher.SetRange("Document No.", "Document No.");
                    ReviewVoucher.SetRange("Document Type", ReviewVoucher."document type"::Moderator);
                    if SetterHeader.FindFirst then begin
                        SetterTopics.Reset;
                        SetterTopics.SetRange("Document No.", "Document No.");
                        SetterTopics.SetRange("Topic Code", "Topic 2 Code");
                        if not SetterTopics.FindSet then begin
                            SetterTopics2.Init;
                            SetterTopics2."Document No." := "Document No.";
                            SetterTopics4.Reset;
                            SetterTopics4.SetCurrentkey("Line No.");
                            if SetterTopics4.FindLast then
                                SetterTopics2."Line No." := SetterTopics4."Line No." + 1;
                            ;
                            SetterTopics2."Topic Code" := "Topic 2 Code";
                            SetterTopics2."Topic Name" := PaperTopicArea.Description;
                            SetterTopics2.Insert(true);

                        end;

                    end;
                end;
                //ReviewVoucher
            end;
        }
        field(17; "Topic 2 Name"; Text[100])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(18; "Topic 2 References"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(27; "Paper Code"; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = Papers;

            trigger OnValidate()
            var
                Papers: Record Papers;
            begin
                Papers.Reset;
                Papers.SetRange(Code, "Paper Code");
                if Papers.FindFirst then begin
                    "Paper Name" := Papers.Description;
                end
            end;
        }
        field(28; "Paper Name"; Text[100])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(29; Examination; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Courses;
        }
        field(30; Level; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Level;
        }
        field(31; "Topic 3 Code"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Paper Topic Setup"."Topic Code" where("Paper Code" = field("Paper Code"));

            trigger OnValidate()
            var
                PaperTopicArea: Record "Paper Topic Area";
            begin
                PaperTopicArea.Reset;
                PaperTopicArea.SetRange(Code, "Topic 3 Code");
                if PaperTopicArea.FindFirst then begin
                    "Topic 3 Name" := PaperTopicArea.Description;
                end;
                if Rec."Topic 3 Code" <> '' then begin
                    SetterHeader.Reset;
                    SetterHeader.SetRange("Document No.", "Document No.");
                    SetterHeader.SetRange("Document Type", SetterHeader."document type"::"Setter Specification");
                    if SetterHeader.FindFirst then begin
                        SetterTopics.Reset;
                        SetterTopics.SetRange("Document No.", "Document No.");
                        SetterTopics.SetRange("Topic Code", "Topic 3 Code");
                        if not SetterTopics.FindSet then begin
                            SetterTopics2.Init;
                            SetterTopics2."Document No." := "Document No.";
                            SetterTopics3.Reset;
                            SetterTopics3.SetCurrentkey("Line No.");
                            if SetterTopics3.FindLast then
                                SetterTopics2."Line No." := SetterTopics3."Line No." + 1;
                            ;
                            SetterTopics2."Topic Code" := "Topic 3 Code";
                            SetterTopics2."Topic Name" := PaperTopicArea.Description;
                            SetterTopics2.Insert(true);

                        end;

                    end;
                    //ReviewVoucher
                    ReviewVoucher.Reset;
                    ReviewVoucher.SetRange("Document No.", "Document No.");
                    ReviewVoucher.SetRange("Document Type", ReviewVoucher."document type"::Moderator);
                    if SetterHeader.FindFirst then begin
                        SetterTopics.Reset;
                        SetterTopics.SetRange("Document No.", "Document No.");
                        SetterTopics.SetRange("Topic Code", "Topic 3 Code");
                        if not SetterTopics.FindSet then begin
                            SetterTopics2.Init;
                            SetterTopics2."Document No." := "Document No.";
                            SetterTopics4.Reset;
                            SetterTopics4.SetCurrentkey("Line No.");
                            if SetterTopics4.FindLast then
                                SetterTopics2."Line No." := SetterTopics4."Line No." + 1;
                            ;
                            SetterTopics2."Topic Code" := "Topic 3 Code";
                            SetterTopics2."Topic Name" := PaperTopicArea.Description;
                            SetterTopics2.Insert(true);

                        end;

                    end;
                end;
                //ReviewVoucher
            end;
        }
        field(32; "Topic 3 Name"; Text[100])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(33; "Topic 3 References"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(34; "Topic 4 Code"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Paper Topic Setup"."Topic Code" where("Paper Code" = field("Paper Code"));

            trigger OnValidate()
            var
                PaperTopicArea: Record "Paper Topic Area";
            begin
                PaperTopicArea.Reset;
                PaperTopicArea.SetRange(Code, "Topic 4 Code");
                if PaperTopicArea.FindFirst then begin
                    "Topic 4 Name" := PaperTopicArea.Description;
                end;
                if Rec."Topic 4 Code" <> '' then begin
                    SetterHeader.Reset;
                    SetterHeader.SetRange("Document No.", "Document No.");
                    SetterHeader.SetRange("Document Type", SetterHeader."document type"::"Setter Specification");
                    if SetterHeader.FindFirst then begin
                        SetterTopics.Reset;
                        SetterTopics.SetRange("Document No.", "Document No.");
                        SetterTopics.SetRange("Topic Code", "Topic 4 Code");
                        if not SetterTopics.FindSet then begin
                            SetterTopics2.Init;
                            SetterTopics2."Document No." := "Document No.";
                            SetterTopics3.Reset;

                            SetterTopics3.SetCurrentkey("Line No.");
                            if SetterTopics3.FindLast then
                                SetterTopics2."Line No." := SetterTopics3."Line No." + 1;
                            ;
                            SetterTopics2."Topic Code" := "Topic 4 Code";
                            SetterTopics2."Topic Name" := PaperTopicArea.Description;
                            SetterTopics2.Insert(true);

                        end;

                    end;

                    //ReviewVoucher
                    ReviewVoucher.Reset;
                    ReviewVoucher.SetRange("Document No.", "Document No.");
                    ReviewVoucher.SetRange("Document Type", ReviewVoucher."document type"::Moderator);
                    if SetterHeader.FindFirst then begin
                        SetterTopics.Reset;
                        SetterTopics.SetRange("Document No.", "Document No.");
                        SetterTopics.SetRange("Topic Code", "Topic 4 Code");
                        if not SetterTopics.FindSet then begin
                            SetterTopics2.Init;
                            SetterTopics2."Document No." := "Document No.";
                            SetterTopics4.Reset;
                            SetterTopics4.SetCurrentkey("Line No.");
                            if SetterTopics4.FindLast then
                                SetterTopics2."Line No." := SetterTopics4."Line No." + 1;
                            ;
                            SetterTopics2."Topic Code" := "Topic 4 Code";
                            SetterTopics2."Topic Name" := PaperTopicArea.Description;
                            SetterTopics2.Insert(true);

                        end;

                    end;
                end;
                //ReviewVoucher
            end;
        }
        field(35; "Topic 4 Name"; Text[100])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(36; "Topic 4 References"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(37; "Topic 5 Code"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Paper Topic Setup"."Topic Code" where("Paper Code" = field("Paper Code"));

            trigger OnValidate()
            var
                PaperTopicArea: Record "Paper Topic Area";
            begin
                PaperTopicArea.Reset;
                PaperTopicArea.SetRange(Code, "Topic 5 Code");
                if PaperTopicArea.FindFirst then begin
                    "Topic 5 Name" := PaperTopicArea.Description;
                end;
                if Rec."Topic 5 Code" <> '' then begin
                    SetterHeader.Reset;
                    SetterHeader.SetRange("Document No.", "Document No.");
                    SetterHeader.SetRange("Document Type", SetterHeader."document type"::"Setter Specification");
                    if SetterHeader.FindFirst then begin
                        SetterTopics.Reset;
                        SetterTopics.SetRange("Document No.", "Document No.");
                        SetterTopics.SetRange("Topic Code", "Topic 5 Code");
                        if not SetterTopics.FindSet then begin
                            SetterTopics2.Init;
                            SetterTopics2."Document No." := "Document No.";
                            SetterTopics3.Reset;
                            SetterTopics3.SetCurrentkey("Line No.");
                            if SetterTopics3.FindLast then
                                SetterTopics2."Line No." := SetterTopics3."Line No." + 1;
                            ;
                            SetterTopics2."Topic Code" := "Topic 5 Code";
                            SetterTopics2."Topic Name" := PaperTopicArea.Description;
                            SetterTopics2.Insert(true);

                        end;

                    end;
                    //ReviewVoucher
                    ReviewVoucher.Reset;
                    ReviewVoucher.SetRange("Document No.", "Document No.");
                    ReviewVoucher.SetRange("Document Type", ReviewVoucher."document type"::Moderator);
                    if SetterHeader.FindFirst then begin
                        SetterTopics.Reset;
                        SetterTopics.SetRange("Document No.", "Document No.");
                        SetterTopics.SetRange("Topic Code", "Topic 5 Code");
                        if not SetterTopics.FindSet then begin
                            SetterTopics2.Init;
                            SetterTopics2."Document No." := "Document No.";
                            SetterTopics4.Reset;
                            SetterTopics4.SetCurrentkey("Line No.");
                            if SetterTopics4.FindLast then
                                SetterTopics2."Line No." := SetterTopics4."Line No." + 1;
                            ;
                            SetterTopics2."Topic Code" := "Topic 5 Code";
                            SetterTopics2."Topic Name" := PaperTopicArea.Description;
                            SetterTopics2.Insert(true);

                        end;

                    end;
                end;
                //ReviewVoucher
            end;
        }
        field(38; "Topic 5 Name"; Text[100])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(39; "Topic 5 References"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(40; Source; Text[2000])
        {
            DataClassification = ToBeClassified;
        }
        field(41; "Ending Question No."; Integer)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Document No.", "Line No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        SetterTopics: Record "Setter Topics";
        SetterHeader: Record "Setter Header";
        SetterTopics2: Record "Setter Topics";
        SetterTopics3: Record "Setter Topics";
        SetterTopi: Record "Setter Topics";
        ReviewVoucher: Record "Examination Review Voucher";
        SetterTopics4: Record "Setter Topics";
}
