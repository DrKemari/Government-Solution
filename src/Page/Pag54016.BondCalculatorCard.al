#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 54016 "Bond Calculator Card"
{
    PageType = Card;
    SourceTable = "Bond Calculator";
    

    layout
    {
        area(content)
        {
            group("Intial Info")
            {
                field(No; Rec.No)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No field.';
                }
                field("FXD No"; Rec."FXD No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the FXD No field.';
                }
                field("System Bond No"; Rec."System Bond No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the System Bond No field.';
                }
                field("Face Value"; Rec."Face Value")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Face Value field.';
                }
                field("Original Term"; Rec."Original Term")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Original Term field.';
                }
                field("Coupon Rate"; Rec."Coupon Rate")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Coupon Rate field.';
                }
                field("Nominal Amount (Cost)"; Rec."Nominal Amount (Cost)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Nominal Amount (Cost) field.';
                }
                field("Custodian Code"; Rec."Custodian Code")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Custodian Code field.';
                }
                field("Fund Code"; Rec."Fund Code")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Fund Code field.';
                }
            }
            group("Input Details")
            {
                field("Settlement Date"; Rec."Settlement Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Settlement Date field.';
                }
                field("Yield(input)"; Rec."Yield(input)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Yield(input) field.';
                }
                field("Dirty Price/per value"; Rec."Dirty Price/per value")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Dirty Price/per value field.';
                }
                field("% commission"; Rec."% commission")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the % commission field.';
                }
            }
            group(Dates)
            {
                field("Issue Date"; Rec."Issue Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Issue Date field.';
                }
                field("Maturity Date"; Rec."Maturity Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Maturity Date field.';
                }
                field("Next Coupon"; Rec."Next Coupon")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Next Coupon field.';
                }
                field("Last Coupon"; Rec."Last Coupon")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Last Coupon field.';
                }
            }
            group("Stastistical Information")
            {
                field("Set to Next"; Rec."Set to Next")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Set to Next field.';
                }
                field("Last to next"; Rec."Last to next")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Last to next field.';
                }
                field("Last to set"; Rec."Last to set")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Last to set field.';
                }
                field("Average unpaid coupons"; Rec."Average unpaid coupons")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Average unpaid coupons field.';
                }
                field("Unpaid Coupon"; Rec."Unpaid Coupon")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Unpaid Coupon field.';
                }
            }
            group("Bond Analysis")
            {
                field("Market Rate"; Rec."Market Rate")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Market Rate field.';
                }
                field(Frequency; Rec.Frequency)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Frequency field.';
                }
                field("Day Basis"; Rec."Day Basis")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Day Basis field.';
                }
                field("Accrued Interest"; Rec."Accrued Interest")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Accrued Interest field.';
                }
                field("Clean Price"; Rec."Clean Price")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Clean Price field.';
                }
                field("Bond Consideration"; Rec."Bond Consideration")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Bond Consideration field.';
                }
                field(Commission; Rec.Commission)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Commission field.';
                }
                field("Net Amount Receivable"; Rec."Net Amount Receivable")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Net Amount Receivable field.';
                }
                field("Book value for the Bond"; Rec."Book value for the Bond")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Book value for the Bond field.';
                }
                field("Accrued Interest 2"; Rec."Accrued Interest 2")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Accrued Interest 2 field.';
                }
                field(Posted; Rec.Posted)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Posted field.';
                }
                field("Loss/Profit on sale of bond"; Rec."Loss/Profit on sale of bond")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Loss/Profit on sale of bond field.';
                }
            }
        }
    }

//     actions
//     {
//         area(creation)
//         {
//             action("Post Accrued Interest")
//             {
//                 // ApplicationArea = Basic;
//                 // Image = Post;
//                 Promoted = true;
//                 PromotedCategory = Process;
//                 ToolTip = 'Executes the Post Accrued Interest action.';
//                 trigger OnAction()
//                 begin
//                     InvestPost.FnPostAccruedInt(Rec);
                    
                    
//                     //******Commented By Morris*****//
//                     /*
//                     //IF Posted THEN
//                     //ERROR('This Revaluation has been Posted');
                    
//                     IF Property.GET("System Bond No") THEN
//                     BEGIN
                    
//                     Property.SETRANGE("Date Filter",0D,"Settlement Date");
//                     Property.CALCFIELDS("Current Value","No.Of Units",Cost,Revaluations,"Accrued Interest");
//                     //MESSAGE('CURRENT VALUE=%1 %2',Property."Current Value",EquityRec.Revaluations);
                    
//                     EquityRec.COPY(Property);
//                     EquityRec.SETRANGE("Date Filter",0D,EndYear("Settlement Date"));
//                     EquityRec.CALCFIELDS(EquityRec.Revaluations);
//                     //MESSAGE('CURRENT VALUE=%1',EquityRec.Revaluations);
                    
                    
//                       // DELETE ANY LINE ITEM THAT MAY BE PRESENT
//                       GenJnlLine.RESET;
//                       GenJnlLine.SETRANGE(GenJnlLine."Journal Template Name",'GENERAL');
//                       GenJnlLine.SETRANGE(GenJnlLine."Journal Batch Name",'JVS');
//                       GenJnlLine.DELETEALL;
                    
//                     {
//                     //*********REVALUATION***********//
//                     //Reverse Previous
                    
//                     // GenJnlLine.Init;
//                     // GenJnlLine."Journal Template Name" := 'GENERAL';
//                     // GenJnlLine."Journal Batch Name" := 'JVS';
//                     // GenJnlLine."Account Type" := GenJnlLine."account type"::"G/L Account";

//                     // if InvestmentPostingGrp.Get(Property."Investment Posting Group") then
//                     //     GenJnlLine."Account No." := InvestmentPostingGrp."Investment Revaluation Account"
//                     // else
//                     //     Error('You must specify Investment Posting Group for Property %1', "System Bond No");

//                     GenJnlLine.Validate(GenJnlLine."Account No.");
//                     GenJnlLine."Line No." := GenJnlLine."Line No." + 10000;
//                     GenJnlLine.Validate(GenJnlLine."Account No.");
//                     GenJnlLine."Posting Date" := "Settlement Date";
//                     GenJnlLine."Document No." := CopyStr('JV-' + "System Bond No" + '-' + Format(GenJnlLine."Posting Date"), 1, 20);

//                     GenJnlLine.Amount := Property.Revaluations;
//                     //GenJnlLine.Amount:=-(Property.Revaluations-EquityRec.Revaluations);

//                     //ERROR('Reval=%1 %2',EquityRec.Revaluations,EndYear(Date));
//                     GenJnlLine.Validate(GenJnlLine.Amount);
//                     GenJnlLine.Description := Property.Description + '' + 'Revaluation Reversal';
//                     GenJnlLine."Investment Code" := "System Bond No";
//                     //GenJnlLine."Investment Transcation Type":=GenJnlLine."Investment Transcation Type"::Revaluation;
//                     //GenJnlLine."Bal. Account Type":=GenJnlLine."Bal. Account Type"::"G/L Account";
//                     GenJnlLine."Shortcut Dimension 1 Code" := Property."Global Dimension 1 Code";
//                     GenJnlLine.Validate(GenJnlLine."Shortcut Dimension 1 Code");
//                     GenJnlLine."Shortcut Dimension 2 Code" := Property."Global Dimension 2 Code";
//                     GenJnlLine.Validate(GenJnlLine."Shortcut Dimension 2 Code");

//                     if GenJnlLine.Amount <> 0 then
//                         GenJnlLine.Insert(true);


//                     if InvestmentPostingGrp.Get(Property."Investment Posting Group") then
//                         GenJnlLine."Account No." := InvestmentPostingGrp."Investment Cost Account"
//                     else
//                         Error('You must specify Investment Posting Group for Property %1', "System Bond No");

//                     GenJnlLine.Validate(GenJnlLine."Account No.");
//                     GenJnlLine."Line No." := GenJnlLine."Line No." + 10000;
//                     GenJnlLine.Validate(GenJnlLine."Account No.");
//                     GenJnlLine."Posting Date" := "Settlement Date";
//                     GenJnlLine."Document No." := CopyStr('JV-' + "System Bond No" + '-' + Format(GenJnlLine."Posting Date"), 1, 20);
//                     //GenJnlLine."External Document No.":="Cheque No";
//                     GenJnlLine.Amount := -(Property.Revaluations);
//                     //GenJnlLine.Amount:=-(Property.Revaluations-EquityRec.Revaluations);

//                     //ERROR('Reval=%1 %2',EquityRec.Revaluations,EndYear(Date));
//                     GenJnlLine.Validate(GenJnlLine.Amount);
//                     GenJnlLine.Description := Property.Description + '' + 'Revaluation Reversal';
//                     GenJnlLine."Investment Code" := "System Bond No";
//                     GenJnlLine."Investment Transcation Type" := GenJnlLine."investment transcation type"::Revaluation;
//                     GenJnlLine."Shortcut Dimension 1 Code" := Property."Global Dimension 1 Code";
//                     GenJnlLine.Validate(GenJnlLine."Shortcut Dimension 1 Code");
//                     GenJnlLine."Shortcut Dimension 2 Code" := Property."Global Dimension 2 Code";
//                     GenJnlLine.Validate(GenJnlLine."Shortcut Dimension 2 Code");

//                     if GenJnlLine.Amount <> 0 then
//                         GenJnlLine.Insert(true);

//                     //End the reversal

//                     //current Revaluation

//                     GenJnlLine.Init;
//                     GenJnlLine."Journal Template Name" := 'GENERAL';
//                     GenJnlLine."Journal Batch Name" := 'JVS';
//                     GenJnlLine."Account Type" := GenJnlLine."account type"::"G/L Account";

//                     if InvestmentPostingGrp.Get(Property."Investment Posting Group") then
//                         GenJnlLine."Account No." := InvestmentPostingGrp."Investment Revaluation Account"
//                     else
//                         Error('You must specify Investment Posting Group for Property %1', "System Bond No");

//                     GenJnlLine.Validate(GenJnlLine."Account No.");
//                     GenJnlLine."Line No." := GenJnlLine."Line No." + 10000;
//                     GenJnlLine.Validate(GenJnlLine."Account No.");
//                     GenJnlLine."Posting Date" := "Settlement Date";
//                     GenJnlLine."Document No." := CopyStr('JV-' + "System Bond No" + '-' + Format(GenJnlLine."Posting Date"), 1, 20);
//                     //GenJnlLine."External Document No.":="Cheque No";
//                     GenJnlLine.Amount := -("Net Amount Receivable" - Property.Cost);
//                     //GenJnlLine.Amount:=((Property."No.Of Units"*"Current Market Value")-Property.Cost)-EquityRec.Revaluations;
//                     //ERROR('Reval=%1 %2',EquityRec.Revaluations,EndYear(Date));
//                     GenJnlLine.Validate(GenJnlLine.Amount);
//                     GenJnlLine.Description := Property.Description + '' + 'Revaluation';
//                     GenJnlLine."Investment Code" := "System Bond No";
//                     //GenJnlLine."Investment Transcation Type":=GenJnlLine."Investment Transcation Type"::Revaluation;
//                     GenJnlLine."Shortcut Dimension 1 Code" := Property."Global Dimension 1 Code";
//                     GenJnlLine.Validate(GenJnlLine."Shortcut Dimension 1 Code");

//                     GenJnlLine."Shortcut Dimension 2 Code" := Property."Global Dimension 2 Code";
//                     GenJnlLine.Validate(GenJnlLine."Shortcut Dimension 2 Code");

//                     if GenJnlLine.Amount <> 0 then
//                         GenJnlLine.Insert(true);


//                     if InvestmentPostingGrp.Get(Property."Investment Posting Group") then
//                         GenJnlLine."Account No." := InvestmentPostingGrp."Investment Cost Account"
//                     else
//                         Error('You must specify Investment Posting Group for Property %1', "System Bond No");

//                     GenJnlLine.Validate(GenJnlLine."Account No.");
//                     GenJnlLine."Line No." := GenJnlLine."Line No." + 10000;
//                     GenJnlLine.Validate(GenJnlLine."Account No.");
//                     GenJnlLine."Posting Date" := "Settlement Date";
//                     GenJnlLine."Document No." := CopyStr('JV-' + "System Bond No" + '-' + Format(GenJnlLine."Posting Date"), 1, 20);
//                     //GenJnlLine."External Document No.":="Cheque No";
//                     GenJnlLine.Amount := "Net Amount Receivable" - Property.Cost;
//                     //GenJnlLine.Amount:=((Property."No.Of Units"*"Current Market Value")-Property.Cost)-EquityRec.Revaluations;
//                     //ERROR('Reval=%1 %2',EquityRec.Revaluations,EndYear(Date));
//                     GenJnlLine.Validate(GenJnlLine.Amount);
//                     GenJnlLine.Description := Property.Description + '' + 'Revaluation';
//                     GenJnlLine."Investment Code" := "System Bond No";
//                     GenJnlLine."Investment Transcation Type" := GenJnlLine."investment transcation type"::Revaluation;
//                     //GenJnlLine."No. Of Units":="No. Of Units";
//                     //GenJnlLine."Expected Receipt date":="Schedule Date";
//                     GenJnlLine."Shortcut Dimension 1 Code" := Property."Global Dimension 1 Code";
//                     GenJnlLine.Validate(GenJnlLine."Shortcut Dimension 1 Code");

//                     GenJnlLine."Shortcut Dimension 2 Code" := Property."Global Dimension 2 Code";
//                     GenJnlLine.Validate(GenJnlLine."Shortcut Dimension 2 Code");



//                     if GenJnlLine.Amount <> 0 then
//                         GenJnlLine.Insert(true);

//                     //end current revaluation

//                     //*********END REVALUATION******************//

            
//                     CodeunitCodeunit                    CodeunitCodeunit                    CodeunitCodeunitPage "Interest Rates";
//                 Visible = false;
// Report "Bondo Cash Flow to Excel";
//     GenJnline;
//     Equities;
//     InvestmentPostingGrp;
//     InvestmentHistory;
//     InstitutionAction;
//     Institution;
//     Property;
//     EquityRec;
//     GenJnlLine;
//     DefaultBatch;
//     Calculator;
//     DefaultDim;
//     RevaluationTable;
//     RevaluationGainLoss;
//     UnitCost;
//     FA;
//     Purchase;
//     Sale;
//     GLsetup;
//     InvestPost;
 //           
//
//     procedure EndYear(var PostDate: Date) EndYearDate: Date
//     var
//         Year: Integer;
//     begin
//         Year := Date2dmy(PostDate, 3);
//         Year := Year - 1;
//         Evaluate(EndYearDate, '3112' + Format(Year));
//         //MESSAGE('%1',EndYearDate);
//     end; 
      }
#pragma implicitwith restore
