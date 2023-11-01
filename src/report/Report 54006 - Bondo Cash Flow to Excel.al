report 54006 "Bondo Cash Flow to Excel"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Bondo Cash Flow to Excel.rdlc';

    dataset
    {
        dataitem("Integer";"Integer")
        {

            trigger OnAfterGetRecord()
            begin

                if FA.Get(Equityfilter) then
                 FA.CalcFields(FA."Acquisition Cost",FA.Discounts);
                j:=j+1;
                if j=Round(k/2,1) then
                LastIntalment:=amt+FA."Acquisition Cost"
                else
                LastIntalment:=amt;
            end;

            trigger OnPreDataItem()
            begin

                 MakeExcelDataHeader;
                 InterestRec.SetRange(InterestRec."Investment No",Equityfilter);
                 i:=Round(InterestRec.Count/2,1)+8;
                 k:=Round(InterestRec.Count,1);
                 n:=i+2;
                 if InterestRec.Find('-') then begin
                 amt:=InterestRec."Expected Interest Amount"*2;
                 end;
                 i:=i+1;
                 Integer.SetRange(Integer.Number,1,Round(k/2,1));
                 Evaluate(m,Format(n));
                 m:='B'+m;
                 InterestCode:='=C10-'+'B10';
                 NBVcode:='=-B8+'+'D10';
                 x:=10;
                Year:='Year1';
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
        ExcelBuf: Record "Excel Buffer" temporary;
        PrintToExcel: Boolean;
        FA: Record "Investment Asset";
        Equityfilter: Code[20];
        InterestRec: Record "Expected Interest1";
        i: Integer;
        IRR: Code[50];
        B: Code[10];
        decimaltext: Code[10];
        k: Integer;
        j: Integer;
        LastIntalment: Decimal;
        amt: Decimal;
        Totalamt: Decimal;
        n: Integer;
        m: Code[10];
        AmortizedInterest: Code[10];
        InterestCode: Code[10];
        NBVcode: Code[10];
        AmortizedInterest2: array [1000] of Code[10];
        InterestCode2: array [1000] of Code[10];
        NBVcode2: array [1000] of Code[10];
        x: Integer;
        y: Integer;
        xy: Code[10];
        c: Code[10];
        D: Code[10];
        BB: Code[10];
        E: Code[10];
        CC: Code[10];
        BBB: Code[10];
        Year: Code[10];
        Calculator: Record "Investment History";
        Text000: Label 'Period: %1';
        Text001: Label 'Trial Balance';
        Text002: Label 'Data';

    local procedure MakeExcelDataHeader()
    begin
        /*ExcelBuf.AddColumn('JUBILEE FINANCIAL SERVICES',FALSE,'',TRUE,FALSE,TRUE,'');
        // Get Equity Name
        ExcelBuf.NewRow;
        
        IF FA.GET(Equityfilter) THEN BEGIN
         FA.CALCFIELDS(FA."Acquisition Cost",FA.Discounts);
         ExcelBuf.AddColumn('FDR Number',FALSE,'',TRUE,FALSE,TRUE,'');
        
         ExcelBuf.AddColumn(FA."FDR Number",FALSE,'',TRUE,FALSE,TRUE,'');
         ExcelBuf.NewRow;
         ExcelBuf.AddColumn('ISSUE DATE',FALSE,'',TRUE,FALSE,TRUE,'');
         ExcelBuf.AddColumn(FA."Issue Date",FALSE,'',TRUE,FALSE,TRUE,'');
        
         ExcelBuf.NewRow;
         ExcelBuf.AddColumn('FACE VALUE',FALSE,'',TRUE,FALSE,TRUE,'');
         ExcelBuf.AddColumn(FA."Acquisition Cost",FALSE,'',TRUE,FALSE,TRUE,'');
         ExcelBuf.NewRow;
         ExcelBuf.AddColumn('COUPON RATE',FALSE,'',TRUE,FALSE,TRUE,'');
         ExcelBuf.AddColumn(FA."Rate %",FALSE,'',TRUE,FALSE,TRUE,'');
         ExcelBuf.NewRow;
         ExcelBuf.AddColumn('ORIGINAL TERM',FALSE,'',TRUE,FALSE,TRUE,'');
         ExcelBuf.AddColumn(FA."Maturity Period",FALSE,'',TRUE,FALSE,TRUE,'');
         ExcelBuf.NewRow;
         ExcelBuf.AddColumn('Discount/Premium',FALSE,'',TRUE,FALSE,TRUE,'');
         ExcelBuf.AddColumn(FA.Discounts,FALSE,'',TRUE,FALSE,TRUE,'');
         Totalamt:=FA.Discounts+FA."Acquisition Cost";
         ExcelBuf.NewRow;
         ExcelBuf.AddColumn('Fair value',FALSE,'',TRUE,FALSE,TRUE,'');
         ExcelBuf.AddColumn(-Totalamt,FALSE,'',TRUE,FALSE,TRUE,'');
         ExcelBuf.NewRow;
         ExcelBuf.AddColumn('',FALSE,'',TRUE,FALSE,TRUE,'');
         ExcelBuf.AddColumn('Cash Received',FALSE,'',TRUE,FALSE,TRUE,'');
         ExcelBuf.AddColumn('Interest',FALSE,'',TRUE,FALSE,TRUE,'');
         ExcelBuf.AddColumn('Discount/Premium',FALSE,'',TRUE,FALSE,TRUE,'');
         ExcelBuf.AddColumn('BOND NBV',FALSE,'',TRUE,FALSE,TRUE,'');
        
        END;*/

    end;

    procedure MakeExcelDataBody()
    var
        BlankFiller: Text[250];
    begin
        /*ExcelBuf.NewRow;
        ExcelBuf.AddColumn(Year,FALSE,'',FALSE,FALSE,FALSE,'');
        
        ExcelBuf.AddColumn(LastIntalment,FALSE,'',FALSE,FALSE,FALSE,'');
        IF j=1 THEN BEGIN
         AmortizedInterest:='=-'+m+'*'+'B8';
         ExcelBuf.AddColumn(AmortizedInterest,FALSE,'',FALSE,FALSE,FALSE,'');
         ExcelBuf.AddColumn(InterestCode,FALSE,'',FALSE,FALSE,FALSE,'');
         ExcelBuf.AddColumn(NBVcode,FALSE,'',FALSE,FALSE,FALSE,'');
        END;
        
        IF x>10 THEN BEGIN
          y:=x-1;
          EVALUATE(xy,FORMAT(y));
          c:='';
          D:='';
          B:='';
          E:='';
          c:='E'+xy;
          c:='='+m+'*'+c;
          ExcelBuf.AddColumn(c,FALSE,'',FALSE,FALSE,FALSE,'');
        
          // D
          EVALUATE(D,FORMAT(x));
          EVALUATE(BB,FORMAT(x));
        
          D:='C'+D;
          CC:='D'+BB;
          BB:='B'+BB;
          BBB:='B'+xy;
          BB:='='+D+'-'+BB;
          BBB:='='+D+'-'+BBB;
        IF j<k/2 THEN
          ExcelBuf.AddColumn(BB,FALSE,'',FALSE,FALSE,FALSE,'')
        ELSE
          ExcelBuf.AddColumn(BBB,FALSE,'',FALSE,FALSE,FALSE,'');
        
          //E
          EVALUATE(E,FORMAT(y));
          E:='E'+E;
          E:='='+CC+'+'+E;
          ExcelBuf.AddColumn(E,FALSE,'',FALSE,FALSE,FALSE,'');
        
        END;*/

    end;

    procedure CreateExcelbook()
    begin
        /*
        ExcelBuf.CreateBook;
        ExcelBuf.CreateSheet(Text002,Text001,'JUBILEEE',USERID);
        ExcelBuf.GiveUserControl;
        ERROR('');*/

    end;

    procedure Makefooter()
    begin
        /*ExcelBuf.NewRow;
        EVALUATE(B,FORMAT(i));
        B:='B'+B;
        EVALUATE(decimaltext,FORMAT(0.15));
        IRR:='=IRR('+'B8:'+B+','+decimaltext+')';
        
        ExcelBuf.AddColumn('Effective interest rate',FALSE,'',FALSE,FALSE,FALSE,'');
        ExcelBuf.AddColumn(IRR,FALSE,'',FALSE,FALSE,FALSE,'');*/

    end;

    procedure GetBond(var BondNo: Code[20])
    begin
        /*Equityfilter:=BondNo;
        */

    end;
}

