#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
/// <summary>
/// Codeunit DMS ManagementV1 (ID 50008).
/// </summary>
Codeunit 50008 "DMS ManagementV1"
{

    trigger OnRun()
    begin
    end;

    var
        Docname: Text;
        FileName: Text;
        Filer: Codeunit "File Management";
        FileName2: Text;
        DocLink: Record "Record Link";
        FileDesc: Text;
        FileWriter: OutStream;
        File1: File;
        Xml1: label '"<?xml version=""1.0"" encoding=""utf-8""?>"'';';
        ConfigOpen: label '<Config>';
        Configclose: label '</Config>';
        FolderOpen: label '<Folder>';
        FolderClose: label '</Folder>';
        Fileopen: label '<Filename>';
        FileClose: label '</Filename>';
        ColumnsOpen: label '<Columns>';
        ColumnsClose: label '</Columns>';
        ColumnOpen: label '<Column>';
        ColumnClose: label '</Column>';
        TitleOpen: label '<Title>';
        TitleClose: label '</Title>';
        ValueOpen: label '<Value>';
        ValueClose: label '</Value>';
        XmlFileName: Text;
        CashManagementSetup: Record "Cash Management Setup";


    procedure UploadDocument(Payments: Record Payments; TabID: RecordID): Boolean
    var
        DocType: Record "DMS Documents";
        DocLines: Record CBRECEIPTS;
        FileName: Text[250];
        // xmlWriter: dotnet XmlTextWriter;
        //  EncodingText: dotnet Encoding;
        CashManagementSetup: Record "Cash Management Setup";
    begin
        DocType.Reset;
        DocType.SetRange("Table Type", DocType."table type"::Payments);
        if DocType.FindSet then begin
            FileName := '';
            FileName2 := '';
            Docname := Payments."No.";
            Docname := ConvertStr(Docname, ':', '_');
            Docname := ConvertStr(Docname, ':', '_');
            //  FileName := Filer.OpenFileDialog('Select Document To Upload', 'Select Document To Upload', 'PDF Files (*.PDF)|*.PDF|All files (*.*)|*.*');
            Message(FileName);
            FileName2 := DocType."Document Path" + Docname + '_' + Filer.GetFileName(FileName);
            Message(FileName2);
            FileDesc := Docname + '_' + Filer.GetFileName(FileName);
            //  Filer.CopyClientFile(FileName, FileName2, true);
            //  Filer.MoveFile(FileName2, 'E:\' + FileDesc);
            // CopyClientFile(FileName,'X:\'+FileName2,TRUE);
            //Insert Link
            DocLink.Init;
            DocLink."Link ID" := 0;
            DocLink.URL1 := DocType."Sharepoint URL" + FileDesc;
            DocLink.Description := FileDesc;
            DocLink.Type := DocLink.Type::Link;
            DocLink.Company := COMPANYNAME;
            DocLink."User ID" := UserId;
            DocLink.Created := CreateDatetime(Today, Time);
            DocLink."Record ID" := TabID;
            DocLink.Insert;
        end
        /*
                //Create Xml Document
                  DocLines.RESET;
                  DocLines.SETRANGE("Document Type",Payments."Document Type");
                  IF DocLines.FIND('-') THEN BEGIN
                    XmlFileName:=DocType."Document Path"+Docname+'.xml';
                    FileName :=DocType."Document Path"+Docname+'.xml';
                    //FileName :=Docname+'.xml';
                     IF ISNULL(xmlWriter) THEN
                    xmlWriter := xmlWriter.XmlTextWriter(XmlFileName, EncodingText.UTF8);
                    xmlWriter.WriteStartDocument();
                    //Create Parent element
                    xmlWriter.WriteStartElement('Columns');
                    xmlWriter.WriteStartElement('Params');
                    xmlWriter.WriteElementString('Library',DocType."Library Name");
                    xmlWriter.WriteElementString('Folder',Docname);
                    xmlWriter.WriteEndElement();
                    xmlWriter.WriteStartElement('Files');
                    xmlWriter.WriteElementString('Filename',FileDesc);
                    xmlWriter.WriteEndElement();
                     //Region Metadata
                    xmlWriter.WriteStartElement('Column');
                    // REPEAT
                    //Create Child elements
                    xmlWriter.WriteElementString('Title',DocLines."Column Name");
                    xmlWriter.WriteElementString('Value',DocLines."Region Code");
                    // xmlWriter.WriteEndElement();
                    // UNTIL DocLines.NEXT = 0;
                    //End writing top element and XML document
                    xmlWriter.WriteEndElement();
                   //Constituency Metadata
                    xmlWriter.WriteStartElement('Column');
                    xmlWriter.WriteElementString('Title','Constituency');
                    xmlWriter.WriteElementString('Value',DocLines."Constituency Code");
                    xmlWriter.WriteEndElement();
                    //Employee Metadata
                    xmlWriter.WriteStartElement('Column');
                    xmlWriter.WriteElementString('Title','Employee');
                    xmlWriter.WriteElementString('Value',USERID);
                    xmlWriter.WriteEndElement();
                    xmlWriter.WriteEndDocument();
                    xmlWriter.Close();
                    END;
                   // Filer.CopyClientFile(FileName,'X:\'+Docname+'.xml',TRUE);
                    Filer.MoveFile(FileName,'X:\'+Docname+'.xml');
                    END;
            */

    end;

    procedure UploadImprestDocuments(DocumentType: Option; DocNo: Code[50]; DocDesc: Text; TabID: RecordID): Boolean
    var
        DocType: Record "DMS Documents";
        DocLines: Record CBRECEIPTS;
        FileName: Text[250];
    //  // xmlWriter: dotnet XmlTextWriter;
    //  EncodingText: dotnet Encoding;
    begin
        /* DocType.RESET;
          DocType.SETRANGE(DocType."Document Type",DocType."Document Type"::Imprest);
          IF DocType.FIND('-') THEN BEGIN
            //Uploade File to folder
             Docname:=DocNo;
             Docname:=CONVERTSTR(Docname,':','_');
             Docname:=CONVERTSTR(Docname,':','_');
             FileName:=Filer.OpenFileDialog('Select Document To Upload','Select Document To Upload','PDF Files (*.PDF)|*.PDF|All files (*.*)|*.*');
            FileName2:=DocType."Document Path"+Docname+'_'+Filer.GetFileName(FileName);
            FileDesc:=Docname+'_'+Filer.GetFileName(FileName);
            Filer.CopyClientFile(FileName,FileName2,TRUE);
            Filer.MoveFile(FileName2,'E:\'+FileDesc);
           // CopyClientFile(FileName,'X:\'+FileName2,TRUE);
            //Insert Link
            DocLink.INIT;
            DocLink."Link ID":=0;
            DocLink.URL1:=DocType."Sharepoint URL"+FileDesc;
            DocLink.Description:=FileDesc;
            DocLink.Type:=DocLink.Type::Link;
            DocLink.Company:=COMPANYNAME;
            DocLink."User ID":=USERID;
            DocLink.Created:=CREATEDATETIME(TODAY,TIME);
            DocLink."Record ID":=TabID;
            DocLink.INSERT;

            //Create Xml Document
              DocLines.RESET;
              DocLines.SETRANGE(ReceiptNo,DocType.);
              IF DocLines.FIND('-') THEN BEGIN
                XmlFileName:=DocType."Document Path"+Docname+'.xml';
                FileName :=DocType."Document Path"+Docname+'.xml';
                //FileName :=Docname+'.xml';
                 IF ISNULL(xmlWriter) THEN
                xmlWriter := xmlWriter.XmlTextWriter(XmlFileName, EncodingText.UTF8);
                xmlWriter.WriteStartDocument();
                //Create Parent element
                xmlWriter.WriteStartElement('Columns');
                xmlWriter.WriteStartElement('Params');
                xmlWriter.WriteElementString('Library',DocType."Library Name");
                xmlWriter.WriteElementString('Folder',Docname);
                xmlWriter.WriteEndElement();
                xmlWriter.WriteStartElement('Files');
                xmlWriter.WriteElementString('Filename',FileDesc);
                xmlWriter.WriteEndElement();
                 //Region Metadata
                xmlWriter.WriteStartElement('Column');
                // REPEAT
                //Create Child elements
                xmlWriter.WriteElementString('Title',DocLines.ReceivedFrom);
                xmlWriter.WriteElementString('Value',DocLines.LastUser);
                // xmlWriter.WriteEndElement();
                // UNTIL DocLines.NEXT = 0;
                //End writing top element and XML document
                xmlWriter.WriteEndElement();
               //Constituency Metadata
                xmlWriter.WriteStartElement('Column');
                xmlWriter.WriteElementString('Title','Constituency');
                xmlWriter.WriteElementString('Value',DocLines.MDate);
                xmlWriter.WriteEndElement();
                //Employee Metadata
                xmlWriter.WriteStartElement('Column');
                xmlWriter.WriteElementString('Title','Employee');
                xmlWriter.WriteElementString('Value',USERID);
                xmlWriter.WriteEndElement();
                xmlWriter.WriteEndDocument();
                xmlWriter.Close();
                END;
               // Filer.CopyClientFile(FileName,'X:\'+Docname+'.xml',TRUE);
                Filer.MoveFile(FileName,'X:\'+Docname+'.xml');
                   MESSAGE('Documents Uploaded Successfully');
                END;
           */


    end;

    procedure UploadStaffClaimDocuments(DocumentType: Option; DocNo: Code[50]; DocDesc: Text; TabID: RecordID; region: Code[100]): Boolean
    var
        DocType: Record "DMS Documents";
        DocLines: Record CBRECEIPTS;
        FileName: Text[250];
    //  xmlWriter: dotnet XmlTextWriter;
    //  EncodingText: dotnet Encoding;
    begin
        CashManagementSetup.Get;
        if CashManagementSetup.Find('-') then begin
            //Uploade File to folder
            Docname := DocNo;
            Docname := ConvertStr(Docname, ':', '_');
            Docname := ConvertStr(Docname, ':', '_');
            //   FileName := Filer.OpenFileDialog('Select Document To Upload', 'Select Document To Upload', 'PDF Files (*.PDF)|*.PDF|All files (*.*)|*.*');
            FileName2 := 'C:\Data\' + Docname + '_' + Filer.GetFileName(FileName);
            FileDesc := Docname + '_' + Filer.GetFileName(FileName);
            //  Filer.CopyClientFile(FileName, FileName2, true);
            //  Filer.MoveFile(FileName2, 'X:\' + FileDesc);
            // CopyClientFile(FileName,'X:\'+FileName2,TRUE);
            //Insert Link
            DocLink.Init;
            DocLink."Link ID" := 0;
            DocLink.URL1 := DocType."Sharepoint URL" + FileDesc;
            DocLink.Description := FileDesc;
            DocLink.Type := DocLink.Type::Link;
            DocLink.Company := COMPANYNAME;
            DocLink."User ID" := UserId;
            DocLink.Created := CreateDatetime(Today, Time);
            DocLink."Record ID" := TabID;
            DocLink.Insert;

            //Create Xml Document
            CashManagementSetup.Reset;
            CashManagementSetup.Get;
            if DocLines.Find('-') then begin
                XmlFileName := 'C:\Data\' + DocNo + '.xml';
                FileName := 'C:\Data\' + Docname + '.xml';
                //FileName :=Docname+'.xml';
                // if IsNull(xmlWriter) then
                //     xmlWriter := xmlWriter.XmlTextWriter(XmlFileName, EncodingText.UTF8);
                // xmlWriter.WriteStartDocument();
                // //Create Parent element
                // xmlWriter.WriteStartElement('Columns');
                // xmlWriter.WriteStartElement('Params');
                // xmlWriter.WriteElementString('Library', CashManagementSetup."SharePoint Site Main Library");
                // xmlWriter.WriteElementString('Region', region);
                // xmlWriter.WriteElementString('Folder', CashManagementSetup."SharePoint Document Library" + '/' + region + '/' + CashManagementSetup."Staff Claims DMS Link" + '/' + Docname);
                // xmlWriter.WriteEndElement();
                // xmlWriter.WriteStartElement('Files');
                // xmlWriter.WriteElementString('Filename', FileDesc);
                // xmlWriter.WriteEndElement();
                // //Region Metadata
                // xmlWriter.WriteStartElement('Column');
                // // REPEAT
                // //Create Child elements
                // xmlWriter.WriteElementString('Title', 'Region');
                // xmlWriter.WriteElementString('Value', region);
                // //End writing top element and XML document
                // xmlWriter.WriteEndElement();
                // //Constituency Metadata
                // xmlWriter.WriteStartElement('Column');
                // xmlWriter.WriteElementString('Title', 'Constituency');
                // xmlWriter.WriteElementString('Value', '');
                // xmlWriter.WriteEndElement();
                // //Employee Metadata
                // xmlWriter.WriteStartElement('Column');
                // xmlWriter.WriteElementString('Title', 'Employee');
                // xmlWriter.WriteElementString('Value', UserId);
                // xmlWriter.WriteEndElement();
                // xmlWriter.WriteEndDocument();
                // xmlWriter.Close();
            end;
            // Filer.CopyClientFile(FileName,'X:\'+Docname+'.xml',TRUE);
            // Filer.MoveFile(FileName, 'X:\' + Docname + '.xml');
        end;


        Message('Documents Uploaded Successffully');

    end;

    procedure UploadImprestSurrenderDocuments(DocNo: Code[50]; DocDesc: Text; TabID: RecordID; region: Code[100]): Boolean
    var
        DocType: Record "DMS Documents";
        DocLines: Record CBRECEIPTS;
        FileName: Text[250];
    // xmlWriter: dotnet XmlTextWriter;
    //   EncodingText: dotnet Encoding;
    begin
        CashManagementSetup.Get;
        if CashManagementSetup.Find('-') then begin
            //Uploade File to folder
            Docname := DocNo;
            Docname := ConvertStr(Docname, ':', '_');
            Docname := ConvertStr(Docname, ':', '_');
            //  FileName := Filer.OpenFileDialog('Select Document To Upload', 'Select Document To Upload', 'PDF Files (*.PDF)|*.PDF|All files (*.*)|*.*');
            FileName2 := 'C:\Data\' + Docname + '_' + Filer.GetFileName(FileName);
            FileDesc := Docname + '_' + Filer.GetFileName(FileName);
            //  Filer.CopyClientFile(FileName, FileName2, true);
            //  Filer.MoveFile(FileName2, 'X:\' + FileDesc);
            // CopyClientFile(FileName,'X:\'+FileName2,TRUE);
            //Insert Link
            DocLink.Init;
            DocLink."Link ID" := 0;
            DocLink.URL1 := DocType."Sharepoint URL" + FileDesc;
            DocLink.Description := FileDesc;
            DocLink.Type := DocLink.Type::Link;
            DocLink.Company := COMPANYNAME;
            DocLink."User ID" := UserId;
            DocLink.Created := CreateDatetime(Today, Time);
            DocLink."Record ID" := TabID;
            DocLink.Insert;

            //Create Xml Document
            CashManagementSetup.Reset;
            CashManagementSetup.Get;
            if DocLines.Find('-') then begin
                XmlFileName := 'C:\Data\' + DocNo + '.xml';
                FileName := 'C:\Data\' + Docname + '.xml';
                //FileName :=Docname+'.xml';
                //   if IsNull(xmlWriter) then
                //    xmlWriter := xmlWriter.XmlTextWriter(XmlFileName, EncodingText.UTF8);
                // xmlWriter.WriteStartDocument();
                // //Create Parent element
                // xmlWriter.WriteStartElement('Columns');
                // xmlWriter.WriteStartElement('Params');
                // xmlWriter.WriteElementString('Library', CashManagementSetup."SharePoint Site Main Library");
                // xmlWriter.WriteElementString('Region', region);
                // xmlWriter.WriteElementString('Folder', CashManagementSetup."SharePoint Document Library" + '/' + region + '/' + CashManagementSetup."Warrant Voucher Default Payabl" + '/' + Docname);
                // xmlWriter.WriteEndElement();
                // xmlWriter.WriteStartElement('Files');
                // xmlWriter.WriteElementString('Filename', FileDesc);
                // xmlWriter.WriteEndElement();
                // //Region Metadata
                // xmlWriter.WriteStartElement('Column');
                // // REPEAT
                // //Create Child elements
                // xmlWriter.WriteElementString('Title', 'Region');
                // xmlWriter.WriteElementString('Value', region);
                // //End writing top element and XML document
                // xmlWriter.WriteEndElement();
                // //Constituency Metadata
                // xmlWriter.WriteStartElement('Column');
                // xmlWriter.WriteElementString('Title', 'Constituency');
                // xmlWriter.WriteElementString('Value', '');
                // xmlWriter.WriteEndElement();
                // //Employee Metadata
                // xmlWriter.WriteStartElement('Column');
                // xmlWriter.WriteElementString('Title', 'Employee');
                // xmlWriter.WriteElementString('Value', UserId);
                // xmlWriter.WriteEndElement();
                // xmlWriter.WriteEndDocument();
                // xmlWriter.Close();
            end;
            // Filer.CopyClientFile(FileName,'X:\'+Docname+'.xml',TRUE);
            //   Filer.MoveFile(FileName, 'X:\' + Docname + '.xml');
        end;

        Message('Documents Uploaded Successffully');

    end;

    procedure UploadPettyCashDocuments(DocNo: Code[50]; DocDesc: Text; TabID: RecordID; Region: Code[100]): Boolean
    var
        DocType: Record "DMS Documents";
        DocLines: Record CBRECEIPTS;
        FileName: Text[250];
    // xmlWriter: dotnet XmlTextWriter;
    //  EncodingText: dotnet Encoding;
    begin
        CashManagementSetup.Get;
        if CashManagementSetup.Find('-') then begin
            //Uploade File to folder
            Docname := DocNo;
            Docname := ConvertStr(Docname, ':', '_');
            Docname := ConvertStr(Docname, ':', '_');
            // FileName := Filer.OpenFileDialog('Select Document To Upload', 'Select Document To Upload', 'PDF Files (*.PDF)|*.PDF|All files (*.*)|*.*');
            FileName2 := 'C:\Data\' + Docname + '_' + Filer.GetFileName(FileName);
            FileDesc := Docname + '_' + Filer.GetFileName(FileName);
            //   Filer.CopyClientFile(FileName, FileName2, true);
            //    Filer.MoveFile(FileName2, 'X:\' + FileDesc);
            // CopyClientFile(FileName,'X:\'+FileName2,TRUE);
            //Insert Link
            DocLink.Init;
            DocLink."Link ID" := 0;
            DocLink.URL1 := DocType."Sharepoint URL" + FileDesc;
            DocLink.Description := FileDesc;
            DocLink.Type := DocLink.Type::Link;
            DocLink.Company := COMPANYNAME;
            DocLink."User ID" := UserId;
            DocLink.Created := CreateDatetime(Today, Time);
            DocLink."Record ID" := TabID;
            DocLink.Insert;

            //Create Xml Document
            CashManagementSetup.Get;
            if DocLines.Find('-') then begin
                XmlFileName := 'C:\Data\' + DocNo + '.xml';
                FileName := 'C:\Data\' + Docname + '.xml';
                //FileName :=Docname+'.xml';
                //   if IsNull(xmlWriter) then
                //      xmlWriter := xmlWriter.XmlTextWriter(XmlFileName, EncodingText.UTF8);
                // xmlWriter.WriteStartDocument();
                // //Create Parent element
                // xmlWriter.WriteStartElement('Columns');
                // xmlWriter.WriteStartElement('Params');
                // xmlWriter.WriteElementString('Library', CashManagementSetup."SharePoint Site Main Library");
                // xmlWriter.WriteElementString('Region', Region);
                // xmlWriter.WriteElementString('Folder', CashManagementSetup."SharePoint Document Library" + '/' + Region + '/' + CashManagementSetup."SharePoint Document Library" + '/' + Docname);
                // xmlWriter.WriteEndElement();
                // xmlWriter.WriteStartElement('Files');
                // xmlWriter.WriteElementString('Filename', FileDesc);
                // xmlWriter.WriteEndElement();
                // //Region Metadata
                // xmlWriter.WriteStartElement('Column');
                // // REPEAT
                // //Create Child elements
                // xmlWriter.WriteElementString('Title', 'Region');
                // xmlWriter.WriteElementString('Value', Region);
                // //End writing top element and XML document
                // xmlWriter.WriteEndElement();
                // //Constituency Metadata
                // xmlWriter.WriteStartElement('Column');
                // xmlWriter.WriteElementString('Title', 'Constituency');
                // xmlWriter.WriteElementString('Value', '');
                // xmlWriter.WriteEndElement();
                // //Employee Metadata
                // xmlWriter.WriteStartElement('Column');
                // xmlWriter.WriteElementString('Title', 'Employee');
                // xmlWriter.WriteElementString('Value', UserId);
                // xmlWriter.WriteEndElement();
                // xmlWriter.WriteEndDocument();
                // xmlWriter.Close();
            end;
            // Filer.CopyClientFile(FileName,'X:\'+Docname+'.xml',TRUE);
            //  Filer.MoveFile(FileName, 'X:\' + Docname + '.xml');
        end;
        Message('Documents Uploaded Successffully');

    end;

    procedure UploadPurchaseRequisitionDocuments(DocNo: Code[50]; DocDesc: Text; TabID: RecordID; Region: Code[100]): Boolean
    var
        DocType: Record "DMS Documents";
        DocLines: Record CBRECEIPTS;
        FileName: Text[250];
    // xmlWriter: dotnet XmlTextWriter;
    // EncodingText: dotnet Encoding;
    begin
        CashManagementSetup.Get;
        if CashManagementSetup.Find('-') then begin
            //Uploade File to folder
            Docname := DocNo;
            Docname := ConvertStr(Docname, ':', '_');
            Docname := ConvertStr(Docname, ':', '_');
            //  FileName := Filer.OpenFileDialog('Select Document To Upload', 'Select Document To Upload', 'PDF Files (*.PDF)|*.PDF|All files (*.*)|*.*');
            FileName2 := 'C:\Data\' + Docname + '_' + Filer.GetFileName(FileName);
            FileDesc := Docname + '_' + Filer.GetFileName(FileName);
            // Filer.CopyClientFile(FileName, FileName2, true);
            //   Filer.MoveFile(FileName2, 'X:\' + FileDesc);
            // CopyClientFile(FileName,'X:\'+FileName2,TRUE);
            //Insert Link
            DocLink.Init;
            DocLink."Link ID" := 0;
            DocLink.URL1 := DocType."Sharepoint URL" + FileDesc;
            DocLink.Description := FileDesc;
            DocLink.Type := DocLink.Type::Link;
            DocLink.Company := COMPANYNAME;
            DocLink."User ID" := UserId;
            DocLink.Created := CreateDatetime(Today, Time);
            DocLink."Record ID" := TabID;
            DocLink.Insert;

            //Create Xml Document
            CashManagementSetup.Get;
            if DocLines.Find('-') then begin
                XmlFileName := 'C:\Data\' + DocNo + '.xml';
                FileName := 'C:\Data\' + Docname + '.xml';
                //FileName :=Docname+'.xml';
                //   if IsNull(xmlWriter) then
                //        xmlWriter := xmlWriter.XmlTextWriter(XmlFileName, EncodingText.UTF8);
                // xmlWriter.WriteStartDocument();
                // //Create Parent element
                // xmlWriter.WriteStartElement('Columns');
                // xmlWriter.WriteStartElement('Params');
                // xmlWriter.WriteElementString('Library', CashManagementSetup."SharePoint Site Main Library");
                // xmlWriter.WriteElementString('Region', Region);
                // xmlWriter.WriteElementString('Folder', CashManagementSetup."SharePoint Document Library" + '/' + Region + '/' + CashManagementSetup."Staff Claims DMS Link" + '/' + Docname);
                // xmlWriter.WriteEndElement();
                // xmlWriter.WriteStartElement('Files');
                // xmlWriter.WriteElementString('Filename', FileDesc);
                // xmlWriter.WriteEndElement();
                // //Region Metadata
                // xmlWriter.WriteStartElement('Column');
                // // REPEAT
                // //Create Child elements
                // xmlWriter.WriteElementString('Title', 'Region');
                // xmlWriter.WriteElementString('Value', Region);
                // //End writing top element and XML document
                // xmlWriter.WriteEndElement();
                // //Constituency Metadata
                // xmlWriter.WriteStartElement('Column');
                // xmlWriter.WriteElementString('Title', 'Constituency');
                // xmlWriter.WriteElementString('Value', '');
                // xmlWriter.WriteEndElement();
                // //Employee Metadata
                // xmlWriter.WriteStartElement('Column');
                // xmlWriter.WriteElementString('Title', 'Employee');
                // xmlWriter.WriteElementString('Value', UserId);
                // xmlWriter.WriteEndElement();
                // xmlWriter.WriteEndDocument();
                // xmlWriter.Close();
            end;
            // Filer.CopyClientFile(FileName,'X:\'+Docname+'.xml',TRUE);
            ///    Filer.MoveFile(FileName, 'X:\' + Docname + '.xml');
        end;

        Message('Documents Uploaded Successffully');

    end;

    procedure UploadStoreRequisitionDocuments(DocNo: Code[50]; DocDesc: Text; TabID: RecordID; Region: Code[100]): Boolean
    var
        DocType: Record "DMS Documents";
        DocLines: Record CBRECEIPTS;
        FileName: Text[250];
    // xmlWriter: dotnet XmlTextWriter;
    // EncodingText: dotnet Encoding;
    begin
        CashManagementSetup.Get;
        if CashManagementSetup.Find('-') then begin
            //Uploade File to folder
            Docname := DocNo;
            Docname := ConvertStr(Docname, ':', '_');
            Docname := ConvertStr(Docname, ':', '_');
            //  FileName := Filer.OpenFileDialog('Select Document To Upload', 'Select Document To Upload', 'PDF Files (*.PDF)|*.PDF|All files (*.*)|*.*');
            FileName2 := 'C:\Data\' + Docname + '_' + Filer.GetFileName(FileName);
            FileDesc := Docname + '_' + Filer.GetFileName(FileName);
            //   Filer.CopyClientFile(FileName, FileName2, true);
            //  Filer.MoveFile(FileName2, 'X:\' + FileDesc);
            // CopyClientFile(FileName,'X:\'+FileName2,TRUE);
            //Insert Link
            DocLink.Init;
            DocLink."Link ID" := 0;
            DocLink.URL1 := DocType."Sharepoint URL" + FileDesc;
            DocLink.Description := FileDesc;
            DocLink.Type := DocLink.Type::Link;
            DocLink.Company := COMPANYNAME;
            DocLink."User ID" := UserId;
            DocLink.Created := CreateDatetime(Today, Time);
            DocLink."Record ID" := TabID;
            DocLink.Insert;
            //Create Xml Document
            CashManagementSetup.Get;
            if DocLines.Find('-') then begin
                XmlFileName := 'C:\Data\' + DocNo + '.xml';
                FileName := 'C:\Data\' + Docname + '.xml';
                //FileName :=Docname+'.xml';
                //    if IsNull(xmlWriter) then
                //     xmlWriter := xmlWriter.XmlTextWriter(XmlFileName, EncodingText.UTF8);
                // xmlWriter.WriteStartDocument();
                // //Create Parent element
                // xmlWriter.WriteStartElement('Columns');
                // xmlWriter.WriteStartElement('Params');
                // xmlWriter.WriteElementString('Library', CashManagementSetup."SharePoint Site Main Library");
                // xmlWriter.WriteElementString('Region', Region);
                // xmlWriter.WriteElementString('Folder', CashManagementSetup."SharePoint Document Library" + '/' + Region + '/' + CashManagementSetup."Staff Claims DMS Link" + '/' + Docname);
                // xmlWriter.WriteEndElement();
                // xmlWriter.WriteStartElement('Files');
                // xmlWriter.WriteElementString('Filename', FileDesc);
                // xmlWriter.WriteEndElement();
                // //Region Metadata
                // xmlWriter.WriteStartElement('Column');
                // // REPEAT
                // //Create Child elements
                // xmlWriter.WriteElementString('Title', 'Region');
                // xmlWriter.WriteElementString('Value', Region);
                // //End writing top element and XML document
                // xmlWriter.WriteEndElement();
                // //Constituency Metadata
                // xmlWriter.WriteStartElement('Column');
                // xmlWriter.WriteElementString('Title', 'Constituency');
                // xmlWriter.WriteElementString('Value', '');
                // xmlWriter.WriteEndElement();
                // //Employee Metadata
                // xmlWriter.WriteStartElement('Column');
                // xmlWriter.WriteElementString('Title', 'Employee');
                // xmlWriter.WriteElementString('Value', UserId);
                // xmlWriter.WriteEndElement();
                // xmlWriter.WriteEndDocument();
                // xmlWriter.Close();
            end;
            // Filer.CopyClientFile(FileName,'X:\'+Docname+'.xml',TRUE);
            //   Filer.MoveFile(FileName, 'X:\' + Docname + '.xml');
        end;
        Message('Documents Uploaded Successffully');

    end;

    procedure UploadPettyCashSurrenderDocuments(DocNo: Code[50]; DocDesc: Text; TabID: RecordID; Region: Code[100]): Boolean
    var
        DocType: Record "DMS Documents";
        DocLines: Record CBRECEIPTS;
        FileName: Text[250];
    //  xmlWriter: dotnet XmlTextWriter;
    //  EncodingText: dotnet Encoding;
    begin
        CashManagementSetup.Get;
        if CashManagementSetup.Find('-') then begin
            //Uploade File to folder
            Docname := DocNo;
            Docname := ConvertStr(Docname, ':', '_');
            Docname := ConvertStr(Docname, ':', '_');
            // FileName := Filer.OpenFileDialog('Select Document To Upload', 'Select Document To Upload', 'PDF Files (*.PDF)|*.PDF|All files (*.*)|*.*');
            FileName2 := 'C:\Data\' + Docname + '_' + Filer.GetFileName(FileName);
            FileDesc := Docname + '_' + Filer.GetFileName(FileName);
            //   Filer.CopyClientFile(FileName, FileName2, true);
            //   Filer.MoveFile(FileName2, 'X:\' + FileDesc);
            // CopyClientFile(FileName,'X:\'+FileName2,TRUE);
            //Insert Link
            DocLink.Init;
            DocLink."Link ID" := 0;
            DocLink.URL1 := DocType."Sharepoint URL" + FileDesc;
            DocLink.Description := FileDesc;
            DocLink.Type := DocLink.Type::Link;
            DocLink.Company := COMPANYNAME;
            DocLink."User ID" := UserId;
            DocLink.Created := CreateDatetime(Today, Time);
            DocLink."Record ID" := TabID;
            DocLink.Insert;

            //Create Xml Document
            CashManagementSetup.Get;
            if DocLines.Find('-') then begin
                XmlFileName := 'C:\Data\' + DocNo + '.xml';
                FileName := 'C:\Data\' + Docname + '.xml';
                //FileName :=Docname+'.xml';
                //   if IsNull(xmlWriter) then
                //        xmlWriter := xmlWriter.XmlTextWriter(XmlFileName, EncodingText.UTF8);
                // xmlWriter.WriteStartDocument();
                // //Create Parent element
                // xmlWriter.WriteStartElement('Columns');
                // xmlWriter.WriteStartElement('Params');
                // xmlWriter.WriteElementString('Library', CashManagementSetup."SharePoint Site Main Library");
                // xmlWriter.WriteElementString('Region', Region);
                // xmlWriter.WriteElementString('Folder', CashManagementSetup."SharePoint Document Library" + '/' + Region + '/' + CashManagementSetup."SharePoint Document Library" + '/' + Docname);
                // xmlWriter.WriteEndElement();
                // xmlWriter.WriteStartElement('Files');
                // xmlWriter.WriteElementString('Filename', FileDesc);
                // xmlWriter.WriteEndElement();
                // //Region Metadata
                // xmlWriter.WriteStartElement('Column');
                // // REPEAT
                // //Create Child elements
                // xmlWriter.WriteElementString('Title', 'Region');
                // xmlWriter.WriteElementString('Value', Region);
                // //End writing top element and XML document
                // xmlWriter.WriteEndElement();
                // //Constituency Metadata
                // xmlWriter.WriteStartElement('Column');
                // xmlWriter.WriteElementString('Title', 'Constituency');
                // xmlWriter.WriteElementString('Value', '');
                // xmlWriter.WriteEndElement();
                // //Employee Metadata
                // xmlWriter.WriteStartElement('Column');
                // xmlWriter.WriteElementString('Title', 'Employee');
                // xmlWriter.WriteElementString('Value', UserId);
                // xmlWriter.WriteEndElement();
                // xmlWriter.WriteEndDocument();
                // xmlWriter.Close();
            end;
            // Filer.CopyClientFile(FileName,'X:\'+Docname+'.xml',TRUE);
            //   Filer.MoveFile(FileName, 'X:\' + Docname + '.xml');
        end;
        Message('Documents Uploaded Successffully');

    end;

    procedure UploadLeaveApplicationsDocuments(DocNo: Code[50]; DocDesc: Text; TabID: RecordID; Region: Code[100]): Boolean
    var
        DocType: Record "DMS Documents";
        DocLines: Record CBRECEIPTS;
        FileName: Text[250];
    // xmlWriter: dotnet XmlTextWriter;
    // EncodingText: dotnet Encoding;
    begin
        CashManagementSetup.Get;
        if CashManagementSetup.Find('-') then begin
            //Uploade File to folder
            Docname := DocNo;
            Docname := ConvertStr(Docname, ':', '_');
            Docname := ConvertStr(Docname, ':', '_');
            // FileName := Filer.OpenFileDialog('Select Document To Upload', 'Select Document To Upload', 'PDF Files (*.PDF)|*.PDF|All files (*.*)|*.*');
            // FileName2 := 'C:\Data\' + Docname + '_' + Filer.GetFileName(FileName);
            // FileDesc := Docname + '_' + Filer.GetFileName(FileName);
            // Filer.CopyClientFile(FileName, FileName2, true);
            // Filer.MoveFile(FileName2, 'X:\' + FileDesc);
            // CopyClientFile(FileName,'X:\'+FileName2,TRUE);
            //Insert Link
            DocLink.Init;
            DocLink."Link ID" := 0;
            DocLink.URL1 := DocType."Sharepoint URL" + FileDesc;
            DocLink.Description := FileDesc;
            DocLink.Type := DocLink.Type::Link;
            DocLink.Company := COMPANYNAME;
            DocLink."User ID" := UserId;
            DocLink.Created := CreateDatetime(Today, Time);
            DocLink."Record ID" := TabID;
            DocLink.Insert;

            //Create Xml Document
            CashManagementSetup.Reset;
            CashManagementSetup.Get;
            if DocLines.Find('-') then begin
                XmlFileName := 'C:\Data\' + DocNo + '.xml';
                FileName := 'C:\Data\' + Docname + '.xml';
                //FileName :=Docname+'.xml';
                // if IsNull(xmlWriter) then
                //     xmlWriter := xmlWriter.XmlTextWriter(XmlFileName, EncodingText.UTF8);
                // xmlWriter.WriteStartDocument();
                // //Create Parent element
                // xmlWriter.WriteStartElement('Columns');
                // xmlWriter.WriteStartElement('Params');
                // xmlWriter.WriteElementString('Library', CashManagementSetup."SharePoint Site Main Library");
                // xmlWriter.WriteElementString('Region', Region);
                // xmlWriter.WriteElementString('Folder', CashManagementSetup."SharePoint Document Library" + '/' + Region + '/' + CashManagementSetup."SharePoint Document Library" + '/' + Docname);
                // xmlWriter.WriteEndElement();
                // xmlWriter.WriteStartElement('Files');
                // xmlWriter.WriteElementString('Filename', FileDesc);
                // xmlWriter.WriteEndElement();
                // //Region Metadata
                // xmlWriter.WriteStartElement('Column');
                // // REPEAT
                // //Create Child elements
                // xmlWriter.WriteElementString('Title', 'Region');
                // xmlWriter.WriteElementString('Value', Region);
                // //End writing top element and XML document
                // xmlWriter.WriteEndElement();
                // //Constituency Metadata
                // xmlWriter.WriteStartElement('Column');
                // xmlWriter.WriteElementString('Title', 'Constituency');
                // xmlWriter.WriteElementString('Value', '');
                // xmlWriter.WriteEndElement();
                // //Employee Metadata
                // xmlWriter.WriteStartElement('Column');
                // xmlWriter.WriteElementString('Title', 'Employee');
                // xmlWriter.WriteElementString('Value', UserId);
                // xmlWriter.WriteEndElement();
                // xmlWriter.WriteEndDocument();
                // xmlWriter.Close();
            end;
            // Filer.CopyClientFile(FileName,'X:\'+Docname+'.xml',TRUE);
            //  Filer.MoveFile(FileName, 'X:\' + Docname + '.xml');
        end;
        Message('Documents Uploaded Successffully');

    end;

    procedure UploadFleetRequisitionDocuments(DocNo: Code[50]; DocDesc: Text; TabID: RecordID; Region: Code[100]): Boolean
    var
        DocType: Record "DMS Documents";
        DocLines: Record CBRECEIPTS;
        FileName: Text[250];
    // xmlWriter: dotnet XmlTextWriter;
    // EncodingText: dotnet Encoding;
    begin
        CashManagementSetup.Get;
        if CashManagementSetup.Find('-') then begin
            //Uploade File to folder
            Docname := DocNo;
            Docname := ConvertStr(Docname, ':', '_');
            Docname := ConvertStr(Docname, ':', '_');
            // FileName := Filer.OpenFileDialog('Select Document To Upload', 'Select Document To Upload', 'PDF Files (*.PDF)|*.PDF|All files (*.*)|*.*');
            // FileName2 := 'C:\Data\' + Docname + '_' + Filer.GetFileName(FileName);
            // FileDesc := Docname + '_' + Filer.GetFileName(FileName);
            // Filer.CopyClientFile(FileName, FileName2, true);
            // Filer.MoveFile(FileName2, 'X:\' + FileDesc);
            // CopyClientFile(FileName,'X:\'+FileName2,TRUE);
            //Insert Link
            DocLink.Init;
            DocLink."Link ID" := 0;
            DocLink.URL1 := DocType."Sharepoint URL" + FileDesc;
            DocLink.Description := FileDesc;
            DocLink.Type := DocLink.Type::Link;
            DocLink.Company := COMPANYNAME;
            DocLink."User ID" := UserId;
            DocLink.Created := CreateDatetime(Today, Time);
            DocLink."Record ID" := TabID;
            DocLink.Insert;

            //Create Xml Document
            CashManagementSetup.Get;
            if DocLines.Find('-') then begin
                XmlFileName := 'C:\Data\' + DocNo + '.xml';
                FileName := 'C:\Data\' + Docname + '.xml';
                //FileName :=Docname+'.xml';
                // if IsNull(xmlWriter) then
                //     xmlWriter := xmlWriter.XmlTextWriter(XmlFileName, EncodingText.UTF8);
                // xmlWriter.WriteStartDocument();
                // //Create Parent element
                // xmlWriter.WriteStartElement('Columns');
                // xmlWriter.WriteStartElement('Params');
                // xmlWriter.WriteElementString('Library', CashManagementSetup."SharePoint Site Main Library");
                // xmlWriter.WriteElementString('Region', Region);
                // xmlWriter.WriteElementString('Folder', CashManagementSetup."SharePoint Document Library" + '/' + Region + '/' + CashManagementSetup."SharePoint Document Library" + '/' + Docname);
                // xmlWriter.WriteEndElement();
                // xmlWriter.WriteStartElement('Files');
                // xmlWriter.WriteElementString('Filename', FileDesc);
                // xmlWriter.WriteEndElement();
                // //Region Metadata
                // xmlWriter.WriteStartElement('Column');
                // // REPEAT
                // //Create Child elements
                // xmlWriter.WriteElementString('Title', 'Region');
                // xmlWriter.WriteElementString('Value', Region);
                // //End writing top element and XML document
                // xmlWriter.WriteEndElement();
                // //Constituency Metadata
                // xmlWriter.WriteStartElement('Column');
                // xmlWriter.WriteElementString('Title', 'Constituency');
                // xmlWriter.WriteElementString('Value', '');
                // xmlWriter.WriteEndElement();
                // //Employee Metadata
                // xmlWriter.WriteStartElement('Column');
                // xmlWriter.WriteElementString('Title', 'Employee');
                // xmlWriter.WriteElementString('Value', UserId);
                // xmlWriter.WriteEndElement();
                // xmlWriter.WriteEndDocument();
                // xmlWriter.Close();
            end;
            // Filer.CopyClientFile(FileName,'X:\'+Docname+'.xml',TRUE);
            //Filer.MoveFile(FileName, 'X:\' + Docname + '.xml');
        end;
        Message('Documents Uploaded Successffully');

    end;

    procedure UploadTrainingRequisitionDocuments(DocNo: Code[50]; DocDesc: Text; TabID: RecordID; Region: Code[100]): Boolean
    var
        DocType: Record "DMS Documents";
        DocLines: Record CBRECEIPTS;
        FileName: Text[250];
    // xmlWriter: dotnet XmlTextWriter;
    // EncodingText: dotnet Encoding;
    begin
        CashManagementSetup.Get;
        if CashManagementSetup.Find('-') then begin
            //Uploade File to folder
            Docname := DocNo;
            Docname := ConvertStr(Docname, ':', '_');
            Docname := ConvertStr(Docname, ':', '_');
            // FileName := Filer.OpenFileDialog('Select Document To Upload', 'Select Document To Upload', 'PDF Files (*.PDF)|*.PDF|All files (*.*)|*.*');
            // FileName2 := 'C:\Data\' + Docname + '_' + Filer.GetFileName(FileName);
            // FileDesc := Docname + '_' + Filer.GetFileName(FileName);
            // Filer.CopyClientFile(FileName, FileName2, true);
            // Filer.MoveFile(FileName2, 'X:\' + FileDesc);
            // // CopyClientFile(FileName,'X:\'+FileName2,TRUE);
            //Insert Link
            DocLink.Init;
            DocLink."Link ID" := 0;
            DocLink.URL1 := DocType."Sharepoint URL" + FileDesc;
            DocLink.Description := FileDesc;
            DocLink.Type := DocLink.Type::Link;
            DocLink.Company := COMPANYNAME;
            DocLink."User ID" := UserId;
            DocLink.Created := CreateDatetime(Today, Time);
            DocLink."Record ID" := TabID;
            DocLink.Insert;

            //Create Xml Document
            CashManagementSetup.Get;
            if DocLines.Find('-') then begin
                XmlFileName := 'C:\Data\' + DocNo + '.xml';
                FileName := 'C:\Data\' + Docname + '.xml';
                //FileName :=Docname+'.xml';
                // if IsNull(xmlWriter) then
                //     xmlWriter := xmlWriter.XmlTextWriter(XmlFileName, EncodingText.UTF8);
                // xmlWriter.WriteStartDocument();
                // //Create Parent element
                // xmlWriter.WriteStartElement('Columns');
                // xmlWriter.WriteStartElement('Params');
                // xmlWriter.WriteElementString('Library', CashManagementSetup."SharePoint Site Main Library");
                // xmlWriter.WriteElementString('Region', Region);
                // xmlWriter.WriteElementString('Folder', CashManagementSetup."SharePoint Document Library" + '/' + Region + '/' + CashManagementSetup."SharePoint Document Library" + '/' + Docname);
                // xmlWriter.WriteEndElement();
                // xmlWriter.WriteStartElement('Files');
                // xmlWriter.WriteElementString('Filename', FileDesc);
                // xmlWriter.WriteEndElement();
                // //Region Metadata
                // xmlWriter.WriteStartElement('Column');
                // // REPEAT
                // //Create Child elements
                // xmlWriter.WriteElementString('Title', 'Region');
                // xmlWriter.WriteElementString('Value', Region);
                // //End writing top element and XML document
                // xmlWriter.WriteEndElement();
                // //Constituency Metadata
                // xmlWriter.WriteStartElement('Column');
                // xmlWriter.WriteElementString('Title', 'Constituency');
                // xmlWriter.WriteElementString('Value', '');
                // xmlWriter.WriteEndElement();
                // //Employee Metadata
                // xmlWriter.WriteStartElement('Column');
                // xmlWriter.WriteElementString('Title', 'Employee');
                // xmlWriter.WriteElementString('Value', UserId);
                // xmlWriter.WriteEndElement();
                // xmlWriter.WriteEndDocument();
                // xmlWriter.Close();
            end;
            // Filer.CopyClientFile(FileName,'X:\'+Docname+'.xml',TRUE);
            // Filer.MoveFile(FileName, 'X:\' + Docname + '.xml');
        end;
        Message('Documents Uploaded Successffully');

    end;

    procedure UploadICTHelpDeskDocuments(DocNo: Code[50]; DocDesc: Text; TabID: RecordID; Region: Code[100]): Boolean
    var
        DocType: Record "DMS Documents";
        DocLines: Record CBRECEIPTS;
        FileName: Text[250];
    // xmlWriter: dotnet XmlTextWriter;
    // EncodingText: dotnet Encoding;
    begin
        CashManagementSetup.Get;
        if CashManagementSetup.Find('-') then begin
            //Uploade File to folder
            Docname := DocNo;
            Docname := ConvertStr(Docname, ':', '_');
            Docname := ConvertStr(Docname, ':', '_');
            //   FileName := Filer.OpenFileDialog('Select Document To Upload', 'Select Document To Upload', 'PDF Files (*.PDF)|*.PDF|All files (*.*)|*.*');
            // FileName2 := 'C:\Data\' + Docname + '_' + Filer.GetFileName(FileName);
            // FileDesc := Docname + '_' + Filer.GetFileName(FileName);
            // Filer.CopyClientFile(FileName, FileName2, true);
            // Filer.MoveFile(FileName2, 'X:\' + FileDesc);
            // CopyClientFile(FileName,'X:\'+FileName2,TRUE);
            //Insert Link
            DocLink.Init;
            DocLink."Link ID" := 0;
            DocLink.URL1 := DocType."Sharepoint URL" + FileDesc;
            DocLink.Description := FileDesc;
            DocLink.Type := DocLink.Type::Link;
            DocLink.Company := COMPANYNAME;
            DocLink."User ID" := UserId;
            DocLink.Created := CreateDatetime(Today, Time);
            DocLink."Record ID" := TabID;
            DocLink.Insert;

            //Create Xml Document
            CashManagementSetup.Get;
            if DocLines.Find('-') then begin
                XmlFileName := 'C:\Data\' + DocNo + '.xml';
                FileName := 'C:\Data\' + Docname + '.xml';
                //FileName :=Docname+'.xml';
                // if IsNull(xmlWriter) then
                //     xmlWriter := xmlWriter.XmlTextWriter(XmlFileName, EncodingText.UTF8);
                // xmlWriter.WriteStartDocument();
                // //Create Parent element
                // xmlWriter.WriteStartElement('Columns');
                // xmlWriter.WriteStartElement('Params');
                // xmlWriter.WriteElementString('Library', CashManagementSetup."SharePoint Site Main Library");
                // xmlWriter.WriteElementString('Region', Region);
                // xmlWriter.WriteElementString('Folder', CashManagementSetup."SharePoint Document Library" + '/' + Region + '/' + CashManagementSetup."SharePoint Document Library" + '/' + Docname);
                // xmlWriter.WriteEndElement();
                // xmlWriter.WriteStartElement('Files');
                // xmlWriter.WriteElementString('Filename', FileDesc);
                // xmlWriter.WriteEndElement();
                // //Region Metadata
                // xmlWriter.WriteStartElement('Column');
                // // REPEAT
                // //Create Child elements
                // xmlWriter.WriteElementString('Title', 'Region');
                // xmlWriter.WriteElementString('Value', Region);
                // //End writing top element and XML document
                // xmlWriter.WriteEndElement();
                // //Constituency Metadata
                // xmlWriter.WriteStartElement('Column');
                // xmlWriter.WriteElementString('Title', 'Constituency');
                // xmlWriter.WriteElementString('Value', '');
                // xmlWriter.WriteEndElement();
                // //Employee Metadata
                // xmlWriter.WriteStartElement('Column');
                // xmlWriter.WriteElementString('Title', 'Employee');
                // xmlWriter.WriteElementString('Value', UserId);
                // xmlWriter.WriteEndElement();
                // xmlWriter.WriteEndDocument();
                // xmlWriter.Close();
            end;
            // Filer.CopyClientFile(FileName,'X:\'+Docname+'.xml',TRUE);
            //  Filer.MoveFile(FileName, 'X:\' + Docname + '.xml');
        end;
        Message('Documents Uploaded Successffully');

    end;

    procedure UploadQuotationDocuments(DocNo: Code[50]; DocDesc: Text; TabID: RecordID; Region: Code[100]): Boolean
    var
        DocType: Record "DMS Documents";
        DocLines: Record CBRECEIPTS;
        FileName: Text[250];
    // xmlWriter: dotnet XmlTextWriter;
    // EncodingText: dotnet Encoding;
    begin
        CashManagementSetup.Get;
        if CashManagementSetup.Find('-') then begin
            //Uploade File to folder
            Docname := DocNo;
            Docname := ConvertStr(Docname, ':', '_');
            Docname := ConvertStr(Docname, ':', '_');
            // FileName := Filer.OpenFileDialog('Select Document To Upload', 'Select Document To Upload', 'PDF Files (*.PDF)|*.PDF|All files (*.*)|*.*');
            // FileName2 := 'C:\Data\' + Docname + '_' + Filer.GetFileName(FileName);
            // FileDesc := Docname + '_' + Filer.GetFileName(FileName);
            // Filer.CopyClientFile(FileName, FileName2, true);
            // Filer.MoveFile(FileName2, 'X:\' + FileDesc);
            // CopyClientFile(FileName,'X:\'+FileName2,TRUE);
            //Insert Link
            DocLink.Init;
            DocLink."Link ID" := 0;
            DocLink.URL1 := DocType."Sharepoint URL" + FileDesc;
            DocLink.Description := FileDesc;
            DocLink.Type := DocLink.Type::Link;
            DocLink.Company := COMPANYNAME;
            DocLink."User ID" := UserId;
            DocLink.Created := CreateDatetime(Today, Time);
            DocLink."Record ID" := TabID;
            DocLink.Insert;

            //Create Xml Document
            CashManagementSetup.Get;
            if DocLines.Find('-') then begin
                XmlFileName := 'C:\Data\' + DocNo + '.xml';
                FileName := 'C:\Data\' + Docname + '.xml';
                //FileName :=Docname+'.xml';
                // if IsNull(xmlWriter) then
                //     xmlWriter := xmlWriter.XmlTextWriter(XmlFileName, EncodingText.UTF8);
                // xmlWriter.WriteStartDocument();
                // //Create Parent element
                // xmlWriter.WriteStartElement('Columns');
                // xmlWriter.WriteStartElement('Params');
                // xmlWriter.WriteElementString('Library', CashManagementSetup."SharePoint Site Main Library");
                // xmlWriter.WriteElementString('Region', Region);
                // xmlWriter.WriteElementString('Folder', CashManagementSetup."SharePoint Document Library" + '/' + Region + '/' + CashManagementSetup."Direct Procurement DMS Link" + '/' + Docname);
                // xmlWriter.WriteEndElement();
                // xmlWriter.WriteStartElement('Files');
                // xmlWriter.WriteElementString('Filename', FileDesc);
                // xmlWriter.WriteEndElement();
                // //Region Metadata
                // xmlWriter.WriteStartElement('Column');
                // // REPEAT
                // //Create Child elements
                // xmlWriter.WriteElementString('Title', 'Region');
                // xmlWriter.WriteElementString('Value', Region);
                // //End writing top element and XML document
                // xmlWriter.WriteEndElement();
                // //Constituency Metadata
                // xmlWriter.WriteStartElement('Column');
                // xmlWriter.WriteElementString('Title', 'Constituency');
                // xmlWriter.WriteElementString('Value', '');
                // xmlWriter.WriteEndElement();
                // //Employee Metadata
                // xmlWriter.WriteStartElement('Column');
                // xmlWriter.WriteElementString('Title', 'Employee');
                // xmlWriter.WriteElementString('Value', UserId);
                // xmlWriter.WriteEndElement();
                // xmlWriter.WriteEndDocument();
                // xmlWriter.Close();
            end;
            // Filer.CopyClientFile(FileName,'X:\'+Docname+'.xml',TRUE);
            //  Filer.MoveFile(FileName, 'X:\' + Docname + '.xml');
        end;

        Message('Documents Uploaded Successffully');

    end;
}

