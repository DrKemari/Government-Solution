#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
/// <summary>
/// Codeunit DMS Management (ID 50009).
/// </summary>
Codeunit 50009 "DMS Management"
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

    procedure UploadImprestDocuments(DocNo: Code[50];DocDesc: Text;TabID: RecordID): Boolean
    var
        DocType: Record "DMS Documents";
        DocLines: Record CBRECEIPTS;
        FileName: Text[250];
          //xmlWriter: dotnet XmlTextWriter;
          //EncodingText: dotnet Encoding;
    begin
              CashManagementSetup.Get;
              if CashManagementSetup.Find('-') then begin
                //Uploade File to folder
                 Docname:=DocNo;
                 Docname:=ConvertStr(Docname,':','_');
                 Docname:=ConvertStr(Docname,':','_');
                   //FileName:=Filer.OpenFileDialog('Select Document To Upload','Select Document To Upload','PDF Files (*.PDF)|*.PDF|All files (*.*)|*.*');
                   //FileName2:='\\192.168.0.95\DocumentsPath\'+Docname+'_'+Filer.GetFileName(FileName);
                  //FileDesc:=Docname+'_'+Filer.GetFileName(FileName);
                 // Filer.CopyClientFile(FileName,FileName2,true);
                  //Filer.MoveFile(FileName2,'\\192.168.0.86\DocumentsPath\'+FileDesc);
               // CopyClientFile(FileName,'X:\'+FileName2,TRUE);
                //Insert Link
                DocLink.Init;
                DocLink."Link ID":=0;
                DocLink.URL1:=CashManagementSetup."SharePoint Site Link"+'/'+CashManagementSetup."SharePoint Site Main Library"+'/'+CashManagementSetup."SharePoint Document Library"+'/'+CashManagementSetup."Imprest Memo DMS Link"+'/'+Docname+'/'+FileDesc;
                DocLink.Description:=FileDesc;
                DocLink.Type:=DocLink.Type::Link;
                DocLink.Company:=COMPANYNAME;
                DocLink."User ID":=UserId;
                DocLink.Created:=CreateDatetime(Today,Time);
                DocLink."Record ID":=TabID;
                DocLink.Insert;

                //Create Xml Document
                  CashManagementSetup.Get;
                  if CashManagementSetup.Find('-') then begin
                    XmlFileName:='\\192.168.0.86\DocumentsPath\'+Docname+'.xml';
                    FileName :='\\192.168.0.86\DocumentsPath\'+Docname+'.xml';
                    //FileName :=Docname+'.xml';
                       //if IsNull(  //xmlWriter) then
                      //xmlWriter :=   //xmlWriter.XmlTextWriter(XmlFileName, EncodingText.UTF8);
                      //xmlWriter.WriteStartDocument();
                    //Create Parent element
                      //xmlWriter.WriteStartElement('Columns');
                      //xmlWriter.WriteStartElement('Params');
                      //xmlWriter.WriteElementString('Library',CashManagementSetup."SharePoint Site Main Library");
                      //xmlWriter.WriteElementString('Folder',CashManagementSetup."SharePoint Document Library"+'/'+CashManagementSetup."Imprest Memo DMS Link"+'/'+Docname);
                      //xmlWriter.WriteEndElement();
                      //xmlWriter.WriteStartElement('Files');
                      //xmlWriter.WriteElementString('Filename',FileDesc);
                      //xmlWriter.WriteEndElement();
                     //Region Metadata
                      //xmlWriter.WriteStartElement('Column');
                    // REPEAT
                    //Create Child elements
                      //xmlWriter.WriteElementString('Title','Region');
                      //xmlWriter.WriteElementString('Value','');
                    //   //xmlWriter.WriteEndElement();
                    // UNTIL DocLines.NEXT = 0;
                    //End writing top element and XML document
                      //xmlWriter.WriteEndElement();
                   //Constituency Metadata
                      //xmlWriter.WriteStartElement('Column');
                      //xmlWriter.WriteElementString('Title','Constituency');
                      //xmlWriter.WriteElementString('Value','');
                      //xmlWriter.WriteEndElement();
                    //Employee Metadata
                      //xmlWriter.WriteStartElement('Column');
                      //xmlWriter.WriteElementString('Title','Employee');
                      //xmlWriter.WriteElementString('Value',UserId);
                      //xmlWriter.WriteEndElement();
                      //xmlWriter.WriteEndDocument();
                      //xmlWriter.Close();
                    end;
                   //  // Filer.CopyClientFile(FileName,'X:\'+Docname+'.xml',TRUE);
                      //Filer.MoveFile(FileName,'\\192.168.0.86\DocumentsPath\'+Docname+'.xml');
                    end;
                  Message('Documents Uploaded Successffully');

    end;

    procedure UploadStaffClaimDocuments(DocumentType: Option;DocNo: Code[50];DocDesc: Text;TabID: RecordID;region: Code[100]): Boolean
    var
        DocType: Record "DMS Documents";
        DocLines: Record CBRECEIPTS;
        FileName: Text[250];
          //xmlWriter: dotnet XmlTextWriter;
          //EncodingText: dotnet Encoding;
    begin
               CashManagementSetup.Get;
              if CashManagementSetup.Find('-') then begin
                //Uploade File to folder
                Docname:=DocNo;
                Docname:=ConvertStr(Docname,':','_');
                Docname:=ConvertStr(Docname,':','_');
                  //FileName:=Filer.OpenFileDialog('Select Document To Upload','Select Document To Upload','PDF Files (*.PDF)|*.PDF|All files (*.*)|*.*');
                  //FileName2:='\\192.168.0.86\DocumentsPath\'+Docname+'_'+Filer.GetFileName(FileName);
                  //FileDesc:=Docname+'_'+Filer.GetFileName(FileName);
                 // Filer.CopyClientFile(FileName,FileName2,true);
                  //Filer.MoveFile(FileName2,'\\192.168.0.86\DocumentsPath\'+FileDesc);
               // CopyClientFile(FileName,'X:\'+FileName2,TRUE);
                //Insert Link
                DocLink.Init;
                DocLink."Link ID":=0;
                DocLink.URL1:=CashManagementSetup."SharePoint Site Link"+'/'+CashManagementSetup."SharePoint Site Main Library"+'/'+CashManagementSetup."SharePoint Document Library"+'/'+CashManagementSetup."Staff Claims DMS Link"+'/'+Docname+'/'+FileDesc;
                DocLink.Description:=FileDesc;
                DocLink.Type:=DocLink.Type::Link;
                DocLink.Company:=COMPANYNAME;
                DocLink."User ID":=UserId;
                DocLink.Created:=CreateDatetime(Today,Time);
                DocLink."Record ID":=TabID;
                DocLink.Insert;

                //Create Xml Document
                CashManagementSetup.Reset;
                CashManagementSetup.Get;
                  if DocLines.Find('-') then begin
                    XmlFileName:='\\192.168.0.86\DocumentsPath\'+DocNo+'.xml';
                    FileName :='\\192.168.0.86\DocumentsPath\'+Docname+'.xml';
                    //FileName :=Docname+'.xml';
                       //if IsNull(  //xmlWriter) then
                      //xmlWriter :=   //xmlWriter.XmlTextWriter(XmlFileName, EncodingText.UTF8);
                      //xmlWriter.WriteStartDocument();
                    //Create Parent element
                      //xmlWriter.WriteStartElement('Columns');
                      //xmlWriter.WriteStartElement('Params');
                      //xmlWriter.WriteElementString('Library',CashManagementSetup."SharePoint Site Main Library");
                      //xmlWriter.WriteElementString('Region',region);
                      //xmlWriter.WriteElementString('Folder',CashManagementSetup."SharePoint Document Library"+'/'+region+'/'+CashManagementSetup."Imprest Surrender DMS Link"+'/'+Docname);
                      //xmlWriter.WriteEndElement();
                      //xmlWriter.WriteStartElement('Files');
                      //xmlWriter.WriteElementString('Filename',FileDesc);
                      //xmlWriter.WriteEndElement();
                     //Region Metadata
                      //xmlWriter.WriteStartElement('Column');
                    // REPEAT
                    //Create Child elements
                      //xmlWriter.WriteElementString('Title','Region');
                      //xmlWriter.WriteElementString('Value',region);
                    //End writing top element and XML document
                      //xmlWriter.WriteEndElement();
                   //Constituency Metadata
                      //xmlWriter.WriteStartElement('Column');
                      //xmlWriter.WriteElementString('Title','Constituency');
                      //xmlWriter.WriteElementString('Value','');
                      //xmlWriter.WriteEndElement();
                    //Employee Metadata
                      //xmlWriter.WriteStartElement('Column');
                      //xmlWriter.WriteElementString('Title','Employee');
                      //xmlWriter.WriteElementString('Value',UserId);
                      //xmlWriter.WriteEndElement();
                      //xmlWriter.WriteEndDocument();
                      //xmlWriter.Close();
                    end;
                   //  // Filer.CopyClientFile(FileName,'X:\'+Docname+'.xml',TRUE);
                      //Filer.MoveFile(FileName,'\\192.168.1.121\DocumentsPath\'+Docname+'.xml');
                    end;


            Message('Documents Uploaded Successffully');

    end;

    procedure UploadImprestSurrenderDocuments(DocNo: Code[50];DocDesc: Text;TabID: RecordID;region: Code[100]): Boolean
    var
        DocType: Record "DMS Documents";
        DocLines: Record CBRECEIPTS;
        FileName: Text[250];
          //xmlWriter: dotnet XmlTextWriter;
          //EncodingText: dotnet Encoding;
    begin
              CashManagementSetup.Get;
              if CashManagementSetup.Find('-') then begin
                //Uploade File to folder
                Docname:=DocNo;
                Docname:=ConvertStr(Docname,':','_');
                Docname:=ConvertStr(Docname,':','_');
                  //FileName:=Filer.OpenFileDialog('Select Document To Upload','Select Document To Upload','PDF Files (*.PDF)|*.PDF|All files (*.*)|*.*');
                  //FileName2:='\\192.168.0.86\DocumentsPath\'+Docname+'_'+Filer.GetFileName(FileName);
                  //FileDesc:=Docname+'_'+Filer.GetFileName(FileName);
                 // Filer.CopyClientFile(FileName,FileName2,true);
                  //Filer.MoveFile(FileName2,'\\192.168.0.86\DocumentsPath\'+FileDesc);
               // CopyClientFile(FileName,'X:\'+FileName2,TRUE);
                //Insert Link
                DocLink.Init;
                DocLink."Link ID":=0;
                DocLink.URL1:=CashManagementSetup."SharePoint Site Link"+'/'+CashManagementSetup."SharePoint Site Main Library"+'/'+CashManagementSetup."SharePoint Document Library"+
                '/'+CashManagementSetup."Imprest Surrender DMS Link"+'/'+Docname+'/'+FileDesc;
                DocLink.Description:=FileDesc;
                DocLink.Type:=DocLink.Type::Link;
                DocLink.Company:=COMPANYNAME;
                DocLink."User ID":=UserId;
                DocLink.Created:=CreateDatetime(Today,Time);
                DocLink."Record ID":=TabID;
                DocLink.Insert;

                //Create Xml Document
                CashManagementSetup.Reset;
                CashManagementSetup.Get;
                  if DocLines.Find('-') then begin
                    XmlFileName:='\\192.168.0.86\DocumentsPath\'+DocNo+'.xml';
                    FileName :='\\192.168.0.86\DocumentsPath\'+Docname+'.xml';
                    //FileName :=Docname+'.xml';
                       //if IsNull(  //xmlWriter) then
                      //xmlWriter :=   //xmlWriter.XmlTextWriter(XmlFileName, EncodingText.UTF8);
                      //xmlWriter.WriteStartDocument();
                    //Create Parent element
                      //xmlWriter.WriteStartElement('Columns');
                      //xmlWriter.WriteStartElement('Params');
                      //xmlWriter.WriteElementString('Library',CashManagementSetup."SharePoint Site Main Library");
                      //xmlWriter.WriteElementString('Region',region);
                      //xmlWriter.WriteElementString('Folder',CashManagementSetup."SharePoint Document Library"+'/'+region+'/'+CashManagementSetup."Warrant Voucher Default Payabl"+'/'+Docname);
                      //xmlWriter.WriteEndElement();
                      //xmlWriter.WriteStartElement('Files');
                      //xmlWriter.WriteElementString('Filename',FileDesc);
                      //xmlWriter.WriteEndElement();
                     //Region Metadata
                      //xmlWriter.WriteStartElement('Column');
                    // REPEAT
                    //Create Child elements
                      //xmlWriter.WriteElementString('Title','Region');
                      //xmlWriter.WriteElementString('Value',region);
                    //End writing top element and XML document
                      //xmlWriter.WriteEndElement();
                   //Constituency Metadata
                      //xmlWriter.WriteStartElement('Column');
                      //xmlWriter.WriteElementString('Title','Constituency');
                      //xmlWriter.WriteElementString('Value','');
                      //xmlWriter.WriteEndElement();
                    //Employee Metadata
                      //xmlWriter.WriteStartElement('Column');
                      //xmlWriter.WriteElementString('Title','Employee');
                      //xmlWriter.WriteElementString('Value',UserId);
                      //xmlWriter.WriteEndElement();
                      //xmlWriter.WriteEndDocument();
                      //xmlWriter.Close();
                    end;
                   //  // Filer.CopyClientFile(FileName,'X:\'+Docname+'.xml',TRUE);
                      //Filer.MoveFile(FileName,'\\192.168.1.121\DocumentsPath\'+Docname+'.xml');
                    end;

              Message('Documents Uploaded Successffully');

    end;

    procedure UploadPettyCashDocuments(DocNo: Code[50];DocDesc: Text;TabID: RecordID;Region: Code[100]): Boolean
    var
        DocType: Record "DMS Documents";
        DocLines: Record CBRECEIPTS;
        FileName: Text[250];
          //xmlWriter: dotnet XmlTextWriter;
          //EncodingText: dotnet Encoding;
    begin
                CashManagementSetup.Get;
              if CashManagementSetup.Find('-') then begin
                //Uploade File to folder
                Docname:=DocNo;
                Docname:=ConvertStr(Docname,':','_');
                Docname:=ConvertStr(Docname,':','_');
                  //FileName:=Filer.OpenFileDialog('Select Document To Upload','Select Document To Upload','PDF Files (*.PDF)|*.PDF|All files (*.*)|*.*');
                  //FileName2:='\\192.168.0.86\DocumentsPath\'+Docname+'_'+Filer.GetFileName(FileName);
                  //FileDesc:=Docname+'_'+Filer.GetFileName(FileName);
                 // Filer.CopyClientFile(FileName,FileName2,true);
                  //Filer.MoveFile(FileName2,'\\192.168.0.86\DocumentsPath\'+FileDesc);
               // CopyClientFile(FileName,'X:\'+FileName2,TRUE);
                //Insert Link
                DocLink.Init;
                DocLink."Link ID":=0;
                DocLink.URL1:=CashManagementSetup."SharePoint Site Link"+'/'+CashManagementSetup."SharePoint Site Main Library"+'/'+CashManagementSetup."SharePoint Document Library"+
                '/'+CashManagementSetup."Petty Cash Voucher DMS Link"+'/'+Docname+'/'+FileDesc;
                DocLink.Description:=FileDesc;
                DocLink.Type:=DocLink.Type::Link;
                DocLink.Company:=COMPANYNAME;
                DocLink."User ID":=UserId;
                DocLink.Created:=CreateDatetime(Today,Time);
                DocLink."Record ID":=TabID;
                DocLink.Insert;

                //Create Xml Document
                 CashManagementSetup.Get;
                  if DocLines.Find('-') then begin
                    XmlFileName:='\\192.168.0.86\DocumentsPath\'+DocNo+'.xml';
                    FileName :='\\192.168.0.86\DocumentsPath\'+Docname+'.xml';
                    //FileName :=Docname+'.xml';
                       //if IsNull(  //xmlWriter) then
                      //xmlWriter :=   //xmlWriter.XmlTextWriter(XmlFileName, EncodingText.UTF8);
                      //xmlWriter.WriteStartDocument();
                    //Create Parent element
                      //xmlWriter.WriteStartElement('Columns');
                      //xmlWriter.WriteStartElement('Params');
                      //xmlWriter.WriteElementString('Library',CashManagementSetup."SharePoint Site Main Library");
                      //xmlWriter.WriteElementString('Region',Region);
                      //xmlWriter.WriteElementString('Folder',CashManagementSetup."SharePoint Document Library"+'/'+Region+'/'+CashManagementSetup."SharePoint Document Library"+'/'+Docname);
                      //xmlWriter.WriteEndElement();
                      //xmlWriter.WriteStartElement('Files');
                      //xmlWriter.WriteElementString('Filename',FileDesc);
                      //xmlWriter.WriteEndElement();
                     //Region Metadata
                      //xmlWriter.WriteStartElement('Column');
                    // REPEAT
                    //Create Child elements
                      //xmlWriter.WriteElementString('Title','Region');
                      //xmlWriter.WriteElementString('Value',Region);
                    //End writing top element and XML document
                      //xmlWriter.WriteEndElement();
                   //Constituency Metadata
                      //xmlWriter.WriteStartElement('Column');
                      //xmlWriter.WriteElementString('Title','Constituency');
                      //xmlWriter.WriteElementString('Value','');
                      //xmlWriter.WriteEndElement();
                    //Employee Metadata
                      //xmlWriter.WriteStartElement('Column');
                      //xmlWriter.WriteElementString('Title','Employee');
                      //xmlWriter.WriteElementString('Value',UserId);
                      //xmlWriter.WriteEndElement();
                      //xmlWriter.WriteEndDocument();
                      //xmlWriter.Close();
                    end;
                   //  // Filer.CopyClientFile(FileName,'X:\'+Docname+'.xml',TRUE);
                      //Filer.MoveFile(FileName,'\\192.168.0.86\DocumentsPath\'+Docname+'.xml');
                    end;
                Message('Documents Uploaded Successffully');

    end;

    procedure UploadPurchaseRequisitionDocuments(DocNo: Code[50];DocDesc: Text;TabID: RecordID;Region: Code[100]): Boolean
    var
        DocType: Record "DMS Documents";
        DocLines: Record CBRECEIPTS;
        FileName: Text[250];
          //xmlWriter: dotnet XmlTextWriter;
          //EncodingText: dotnet Encoding;
    begin
              CashManagementSetup.Get;
              if CashManagementSetup.Find('-') then begin
                //Uploade File to folder
                Docname:=DocNo;
                Docname:=ConvertStr(Docname,':','_');
                Docname:=ConvertStr(Docname,':','_');
                  //FileName:=Filer.OpenFileDialog('Select Document To Upload','Select Document To Upload','PDF Files (*.PDF)|*.PDF|All files (*.*)|*.*');
                  //FileName2:='\\192.168.0.86\DocumentsPath\'+Docname+'_'+Filer.GetFileName(FileName);
                  //FileDesc:=Docname+'_'+Filer.GetFileName(FileName);
                 // Filer.CopyClientFile(FileName,FileName2,true);
                  //Filer.MoveFile(FileName2,'\\192.168.1.121\DocumentsPath\'+FileDesc);
               // CopyClientFile(FileName,'X:\'+FileName2,TRUE);
                //Insert Link
                DocLink.Init;
                DocLink."Link ID":=0;
                 DocLink.URL1:=CashManagementSetup."SharePoint Site Link"+'/'+CashManagementSetup."SharePoint Site Main Library"+'/'+CashManagementSetup."SharePoint Document Library"+'/'
                +CashManagementSetup."Purchase Requisition Link"+'/'+Docname+'/'+FileDesc;
                DocLink.Description:=FileDesc;
                DocLink.Type:=DocLink.Type::Link;
                DocLink.Company:=COMPANYNAME;
                DocLink."User ID":=UserId;
                DocLink.Created:=CreateDatetime(Today,Time);
                DocLink."Record ID":=TabID;
                DocLink.Insert;

                //Create Xml Document
                CashManagementSetup.Get;
                  if DocLines.Find('-') then begin
                    XmlFileName:='\\192.168.0.86\DocumentsPath\'+DocNo+'.xml';
                    FileName :='\\192.168.0.86\DocumentsPath\'+Docname+'.xml';
                    //FileName :=Docname+'.xml';
                       //if IsNull(  //xmlWriter) then
                      //xmlWriter :=   //xmlWriter.XmlTextWriter(XmlFileName, EncodingText.UTF8);
                      //xmlWriter.WriteStartDocument();
                    //Create Parent element
                      //xmlWriter.WriteStartElement('Columns');
                      //xmlWriter.WriteStartElement('Params');
                      //xmlWriter.WriteElementString('Library',CashManagementSetup."SharePoint Site Main Library");
                      //xmlWriter.WriteElementString('Region',Region);
                      //xmlWriter.WriteElementString('Folder',CashManagementSetup."SharePoint Document Library"+'/'+Region+'/'+CashManagementSetup."Imprest Surrender DMS Link"+'/'+Docname);
                      //xmlWriter.WriteEndElement();
                      //xmlWriter.WriteStartElement('Files');
                      //xmlWriter.WriteElementString('Filename',FileDesc);
                      //xmlWriter.WriteEndElement();
                     //Region Metadata
                      //xmlWriter.WriteStartElement('Column');
                   // REPEAT
                    //Create Child elements
                      //xmlWriter.WriteElementString('Title','Region');
                      //xmlWriter.WriteElementString('Value',Region);
                    //End writing top element and XML document
                      //xmlWriter.WriteEndElement();
                   //Constituency Metadata
                      //xmlWriter.WriteStartElement('Column');
                      //xmlWriter.WriteElementString('Title','Constituency');
                      //xmlWriter.WriteElementString('Value','');
                      //xmlWriter.WriteEndElement();
                    //Employee Metadata
                      //xmlWriter.WriteStartElement('Column');
                      //xmlWriter.WriteElementString('Title','Employee');
                      //xmlWriter.WriteElementString('Value',UserId);
                      //xmlWriter.WriteEndElement();
                      //xmlWriter.WriteEndDocument();
                      //xmlWriter.Close();
                    end;
                   //  // Filer.CopyClientFile(FileName,'X:\'+Docname+'.xml',TRUE);
                      //Filer.MoveFile(FileName,'\\192.168.1.121\DocumentsPath\'+Docname+'.xml');
                    end;
               Message('Documents Uploaded Successffully');

    end;

    procedure UploadStoreRequisitionDocuments(DocNo: Code[50];DocDesc: Text;TabID: RecordID;Region: Code[100]): Boolean
    var
        DocType: Record "DMS Documents";
        DocLines: Record CBRECEIPTS;
        FileName: Text[250];
          //xmlWriter: dotnet XmlTextWriter;
          //EncodingText: dotnet Encoding;
    begin
              CashManagementSetup.Get;
              if CashManagementSetup.Find('-') then begin
                //Uploade File to folder
                Docname:=DocNo;
                Docname:=ConvertStr(Docname,':','_');
                Docname:=ConvertStr(Docname,':','_');
                  //FileName:=Filer.OpenFileDialog('Select Document To Upload','Select Document To Upload','PDF Files (*.PDF)|*.PDF|All files (*.*)|*.*');
                  //FileName2:='\\192.168.0.86\DocumentsPath\'+Docname+'_'+Filer.GetFileName(FileName);
                  //FileDesc:=Docname+'_'+Filer.GetFileName(FileName);
                 // Filer.CopyClientFile(FileName,FileName2,true);
                  //Filer.MoveFile(FileName2,'\\192.168.0.86\DocumentsPath\'+FileDesc);
               // CopyClientFile(FileName,'X:\'+FileName2,TRUE);
                //Insert Link
                DocLink.Init;
                DocLink."Link ID":=0;
                DocLink.URL1:=CashManagementSetup."SharePoint Site Link"+'/'+CashManagementSetup."SharePoint Site Main Library"+'/'+CashManagementSetup."SharePoint Document Library"+'/'
                +CashManagementSetup."Store Requisition Links"+'/'+Docname+'/'+FileDesc;
                DocLink.Description:=FileDesc;
                DocLink.Type:=DocLink.Type::Link;
                DocLink.Company:=COMPANYNAME;
                DocLink."User ID":=UserId;
                DocLink.Created:=CreateDatetime(Today,Time);
                DocLink."Record ID":=TabID;
                DocLink.Insert;
                //Create Xml Document
                CashManagementSetup.Get;
                  if DocLines.Find('-') then begin
                     XmlFileName:='C:\Data\'+DocNo+'.xml';
                     FileName:=  'C:\Data\'+Docname+'.xml';
                    //FileName :=Docname+'.xml';
                       //if IsNull(  //xmlWriter) then
                      //xmlWriter :=   //xmlWriter.XmlTextWriter(XmlFileName, EncodingText.UTF8);
                      //xmlWriter.WriteStartDocument();
                    //Create Parent element
                      //xmlWriter.WriteStartElement('Columns');
                      //xmlWriter.WriteStartElement('Params');
                      //xmlWriter.WriteElementString('Library',CashManagementSetup."SharePoint Site Main Library");
                      //xmlWriter.WriteElementString('Region',Region);
                      //xmlWriter.WriteElementString('Folder',CashManagementSetup."SharePoint Document Library"+'/'+Region+'/'+CashManagementSetup."Imprest Surrender DMS Link"+'/'+Docname);
                      //xmlWriter.WriteEndElement();
                      //xmlWriter.WriteStartElement('Files');
                      //xmlWriter.WriteElementString('Filename',FileDesc);
                      //xmlWriter.WriteEndElement();
                     //Region Metadata
                      //xmlWriter.WriteStartElement('Column');
                    // REPEAT
                    //Create Child elements
                      //xmlWriter.WriteElementString('Title','Region');
                      //xmlWriter.WriteElementString('Value',Region);
                    //End writing top element and XML document
                      //xmlWriter.WriteEndElement();
                   //Constituency Metadata
                      //xmlWriter.WriteStartElement('Column');
                      //xmlWriter.WriteElementString('Title','Constituency');
                      //xmlWriter.WriteElementString('Value','');
                      //xmlWriter.WriteEndElement();
                    //Employee Metadata
                      //xmlWriter.WriteStartElement('Column');
                      //xmlWriter.WriteElementString('Title','Employee');
                      //xmlWriter.WriteElementString('Value',UserId);
                      //xmlWriter.WriteEndElement();
                      //xmlWriter.WriteEndDocument();
                      //xmlWriter.Close();
                    end;
                   //  // Filer.CopyClientFile(FileName,'X:\'+Docname+'.xml',TRUE);
                      //Filer.MoveFile(FileName,'X:\'+Docname+'.xml');
                    end;
                 Message('Documents Uploaded Successffully');

    end;

    procedure UploadPettyCashSurrenderDocuments(DocNo: Code[50];DocDesc: Text;TabID: RecordID;Region: Code[100]): Boolean
    var
        DocType: Record "DMS Documents";
        DocLines: Record CBRECEIPTS;
        FileName: Text[250];
          //xmlWriter: dotnet XmlTextWriter;
          //EncodingText: dotnet Encoding;
    begin
                CashManagementSetup.Get;
              if CashManagementSetup.Find('-') then begin
                //Uploade File to folder
                Docname:=DocNo;
                Docname:=ConvertStr(Docname,':','_');
                Docname:=ConvertStr(Docname,':','_');
                  //FileName:=Filer.OpenFileDialog('Select Document To Upload','Select Document To Upload','PDF Files (*.PDF)|*.PDF|All files (*.*)|*.*');
                FileName2:='C:\Data\'+Docname+'_'+Filer.GetFileName(FileName);
                  //FileDesc:=Docname+'_'+Filer.GetFileName(FileName);
                 // Filer.CopyClientFile(FileName,FileName2,true);
                  //Filer.MoveFile(FileName2,'X:\'+FileDesc);
               // CopyClientFile(FileName,'X:\'+FileName2,TRUE);
                //Insert Link
                DocLink.Init;
                DocLink."Link ID":=0;
                DocLink.URL1:=CashManagementSetup."SharePoint Site Link"+'/'+CashManagementSetup."SharePoint Site Main Library"+'/'+CashManagementSetup."SharePoint Document Library"+
                '/'+CashManagementSetup."Petty Cash Surrender DMS Link"+'/'+Docname+'/'+FileDesc;
                DocLink.Description:=FileDesc;
                DocLink.Type:=DocLink.Type::Link;
                DocLink.Company:=COMPANYNAME;
                DocLink."User ID":=UserId;
                DocLink.Created:=CreateDatetime(Today,Time);
                DocLink."Record ID":=TabID;
                DocLink.Insert;

                //Create Xml Document
                CashManagementSetup.Get;
                  if DocLines.Find('-') then begin
                    XmlFileName:='C:\Data\'+DocNo+'.xml';
                    FileName :='C:\Data\'+Docname+'.xml';
                    //FileName :=Docname+'.xml';
                       //if IsNull(  //xmlWriter) then
                      //xmlWriter :=   //xmlWriter.XmlTextWriter(XmlFileName, EncodingText.UTF8);
                      //xmlWriter.WriteStartDocument();
                    //Create Parent element
                      //xmlWriter.WriteStartElement('Columns');
                      //xmlWriter.WriteStartElement('Params');
                      //xmlWriter.WriteElementString('Library',CashManagementSetup."SharePoint Site Main Library");
                      //xmlWriter.WriteElementString('Region',Region);
                      //xmlWriter.WriteElementString('Folder',CashManagementSetup."SharePoint Document Library"+'/'+Region+'/'+CashManagementSetup."SharePoint Document Library"+'/'+Docname);
                      //xmlWriter.WriteEndElement();
                      //xmlWriter.WriteStartElement('Files');
                      //xmlWriter.WriteElementString('Filename',FileDesc);
                      //xmlWriter.WriteEndElement();
                     //Region Metadata
                      //xmlWriter.WriteStartElement('Column');
                    // REPEAT
                    //Create Child elements
                      //xmlWriter.WriteElementString('Title','Region');
                      //xmlWriter.WriteElementString('Value',Region);
                    //End writing top element and XML document
                      //xmlWriter.WriteEndElement();
                   //Constituency Metadata
                      //xmlWriter.WriteStartElement('Column');
                      //xmlWriter.WriteElementString('Title','Constituency');
                      //xmlWriter.WriteElementString('Value','');
                      //xmlWriter.WriteEndElement();
                    //Employee Metadata
                      //xmlWriter.WriteStartElement('Column');
                      //xmlWriter.WriteElementString('Title','Employee');
                      //xmlWriter.WriteElementString('Value',UserId);
                      //xmlWriter.WriteEndElement();
                      //xmlWriter.WriteEndDocument();
                      //xmlWriter.Close();
                    end;
                   //  // Filer.CopyClientFile(FileName,'X:\'+Docname+'.xml',TRUE);
                      //Filer.MoveFile(FileName,'X:\'+Docname+'.xml');
                    end;
                Message('Documents Uploaded Successffully');

    end;

    procedure UploadLeaveApplicationsDocuments(DocNo: Code[50];DocDesc: Text;TabID: RecordID;Region: Code[100]): Boolean
    var
        DocType: Record "DMS Documents";
        DocLines: Record CBRECEIPTS;
        FileName: Text[250];
          //xmlWriter: dotnet XmlTextWriter;
          //EncodingText: dotnet Encoding;
    begin
                CashManagementSetup.Get;
              if CashManagementSetup.Find('-') then begin
                //Uploade File to folder
                Docname:=DocNo;
                Docname:=ConvertStr(Docname,':','_');
                Docname:=ConvertStr(Docname,':','_');
                  //FileName:=Filer.OpenFileDialog('Select Document To Upload','Select Document To Upload','PDF Files (*.PDF)|*.PDF|All files (*.*)|*.*');
                FileName2:='C:\Data\'+Docname+'_'+Filer.GetFileName(FileName);
                  //FileDesc:=Docname+'_'+Filer.GetFileName(FileName);
                 // Filer.CopyClientFile(FileName,FileName2,true);
                  //Filer.MoveFile(FileName2,'X:\'+FileDesc);
               // CopyClientFile(FileName,'X:\'+FileName2,TRUE);
                //Insert Link
                DocLink.Init;
                DocLink."Link ID":=0;
                DocLink.URL1:=CashManagementSetup."SharePoint Site Link"+'/'+CashManagementSetup."SharePoint Site Main Library"+'/'+CashManagementSetup."SharePoint Document Library"+'/'
                +CashManagementSetup."Leave Applications DMS Link"+'/'+Docname+'/'+FileDesc;
                DocLink.Description:=FileDesc;
                DocLink.Type:=DocLink.Type::Link;
                DocLink.Company:=COMPANYNAME;
                DocLink."User ID":=UserId;
                DocLink.Created:=CreateDatetime(Today,Time);
                DocLink."Record ID":=TabID;
                DocLink.Insert;

                //Create Xml Document
                CashManagementSetup.Reset;
                CashManagementSetup.Get;
                  if DocLines.Find('-') then begin
                    XmlFileName:='C:\Data\'+DocNo+'.xml';
                    FileName :='C:\Data\'+Docname+'.xml';
                    //FileName :=Docname+'.xml';
                       //if IsNull(  //xmlWriter) then
                      //xmlWriter :=   //xmlWriter.XmlTextWriter(XmlFileName, EncodingText.UTF8);
                      //xmlWriter.WriteStartDocument();
                    //Create Parent element
                      //xmlWriter.WriteStartElement('Columns');
                      //xmlWriter.WriteStartElement('Params');
                      //xmlWriter.WriteElementString('Library',CashManagementSetup."SharePoint Site Main Library");
                      //xmlWriter.WriteElementString('Region',Region);
                      //xmlWriter.WriteElementString('Folder',CashManagementSetup."SharePoint Document Library"+'/'+Region+'/'+CashManagementSetup."SharePoint Document Library"+'/'+Docname);
                      //xmlWriter.WriteEndElement();
                      //xmlWriter.WriteStartElement('Files');
                      //xmlWriter.WriteElementString('Filename',FileDesc);
                      //xmlWriter.WriteEndElement();
                     //Region Metadata
                      //xmlWriter.WriteStartElement('Column');
                    // REPEAT
                    //Create Child elements
                      //xmlWriter.WriteElementString('Title','Region');
                      //xmlWriter.WriteElementString('Value',Region);
                    //End writing top element and XML document
                      //xmlWriter.WriteEndElement();
                   //Constituency Metadata
                      //xmlWriter.WriteStartElement('Column');
                      //xmlWriter.WriteElementString('Title','Constituency');
                      //xmlWriter.WriteElementString('Value','');
                      //xmlWriter.WriteEndElement();
                    //Employee Metadata
                      //xmlWriter.WriteStartElement('Column');
                      //xmlWriter.WriteElementString('Title','Employee');
                      //xmlWriter.WriteElementString('Value',UserId);
                      //xmlWriter.WriteEndElement();
                      //xmlWriter.WriteEndDocument();
                      //xmlWriter.Close();
                    end;
                   //  // Filer.CopyClientFile(FileName,'X:\'+Docname+'.xml',TRUE);
                      //Filer.MoveFile(FileName,'X:\'+Docname+'.xml');
                    end;
                Message('Documents Uploaded Successffully');

    end;

    procedure UploadFleetRequisitionDocuments(DocNo: Code[50];DocDesc: Text;TabID: RecordID;Region: Code[100]): Boolean
    var
        DocType: Record "DMS Documents";
        DocLines: Record CBRECEIPTS;
        FileName: Text[250];
          //xmlWriter: dotnet XmlTextWriter;
          //EncodingText: dotnet Encoding;
    begin
                CashManagementSetup.Get;
              if CashManagementSetup.Find('-') then begin
                //Uploade File to folder
                Docname:=DocNo;
                Docname:=ConvertStr(Docname,':','_');
                Docname:=ConvertStr(Docname,':','_');
                  //FileName:=Filer.OpenFileDialog('Select Document To Upload','Select Document To Upload','PDF Files (*.PDF)|*.PDF|All files (*.*)|*.*');
                FileName2:='C:\Data\'+Docname+'_'+Filer.GetFileName(FileName);
                  //FileDesc:=Docname+'_'+Filer.GetFileName(FileName);
                 // Filer.CopyClientFile(FileName,FileName2,true);
                  //Filer.MoveFile(FileName2,'X:\'+FileDesc);
               // CopyClientFile(FileName,'X:\'+FileName2,TRUE);
                //Insert Link
                DocLink.Init;
                DocLink."Link ID":=0;
                DocLink.URL1:=DocType."Sharepoint URL"+FileDesc;
                DocLink.Description:=FileDesc;
                DocLink.Type:=DocLink.Type::Link;
                DocLink.Company:=COMPANYNAME;
                DocLink."User ID":=UserId;
                DocLink.Created:=CreateDatetime(Today,Time);
                DocLink."Record ID":=TabID;
                DocLink.Insert;

                //Create Xml Document
                CashManagementSetup.Get;
                  if DocLines.Find('-') then begin
                    XmlFileName:='C:\Data\'+DocNo+'.xml';
                    FileName :='C:\Data\'+Docname+'.xml';
                    //FileName :=Docname+'.xml';
                       //if IsNull(  //xmlWriter) then
                      //xmlWriter :=   //xmlWriter.XmlTextWriter(XmlFileName, EncodingText.UTF8);
                      //xmlWriter.WriteStartDocument();
                    //Create Parent element
                      //xmlWriter.WriteStartElement('Columns');
                      //xmlWriter.WriteStartElement('Params');
                      //xmlWriter.WriteElementString('Library',CashManagementSetup."SharePoint Site Main Library");
                      //xmlWriter.WriteElementString('Region',Region);
                      //xmlWriter.WriteElementString('Folder',CashManagementSetup."SharePoint Document Library"+'/'+Region+'/'+CashManagementSetup."SharePoint Document Library"+'/'+Docname);
                      //xmlWriter.WriteEndElement();
                      //xmlWriter.WriteStartElement('Files');
                      //xmlWriter.WriteElementString('Filename',FileDesc);
                      //xmlWriter.WriteEndElement();
                     //Region Metadata
                      //xmlWriter.WriteStartElement('Column');
                    // REPEAT
                    //Create Child elements
                      //xmlWriter.WriteElementString('Title','Region');
                      //xmlWriter.WriteElementString('Value',Region);
                    //End writing top element and XML document
                      //xmlWriter.WriteEndElement();
                   //Constituency Metadata
                      //xmlWriter.WriteStartElement('Column');
                      //xmlWriter.WriteElementString('Title','Constituency');
                      //xmlWriter.WriteElementString('Value','');
                      //xmlWriter.WriteEndElement();
                    //Employee Metadata
                      //xmlWriter.WriteStartElement('Column');
                      //xmlWriter.WriteElementString('Title','Employee');
                      //xmlWriter.WriteElementString('Value',UserId);
                      //xmlWriter.WriteEndElement();
                      //xmlWriter.WriteEndDocument();
                      //xmlWriter.Close();
                    end;
                   //  // Filer.CopyClientFile(FileName,'X:\'+Docname+'.xml',TRUE);
                      //Filer.MoveFile(FileName,'X:\'+Docname+'.xml');
                    end;
                Message('Documents Uploaded Successffully');

    end;

    procedure UploadTrainingRequisitionDocuments(DocNo: Code[50];DocDesc: Text;TabID: RecordID;Region: Code[100]): Boolean
    var
        DocType: Record "DMS Documents";
        DocLines: Record CBRECEIPTS;
        FileName: Text[250];
          //xmlWriter: dotnet XmlTextWriter;
          //EncodingText: dotnet Encoding;
    begin
                CashManagementSetup.Get;
              if CashManagementSetup.Find('-') then begin
                //Uploade File to folder
                Docname:=DocNo;
                Docname:=ConvertStr(Docname,':','_');
                Docname:=ConvertStr(Docname,':','_');
                  //FileName:=Filer.OpenFileDialog('Select Document To Upload','Select Document To Upload','PDF Files (*.PDF)|*.PDF|All files (*.*)|*.*');
                FileName2:='C:\Data\'+Docname+'_'+Filer.GetFileName(FileName);
                  //FileDesc:=Docname+'_'+Filer.GetFileName(FileName);
                 // Filer.CopyClientFile(FileName,FileName2,true);
                  //Filer.MoveFile(FileName2,'X:\'+FileDesc);
               // CopyClientFile(FileName,'X:\'+FileName2,TRUE);
                //Insert Link
                DocLink.Init;
                DocLink."Link ID":=0;
                DocLink.URL1:=DocType."Sharepoint URL"+FileDesc;
                DocLink.Description:=FileDesc;
                DocLink.Type:=DocLink.Type::Link;
                DocLink.Company:=COMPANYNAME;
                DocLink."User ID":=UserId;
                DocLink.Created:=CreateDatetime(Today,Time);
                DocLink."Record ID":=TabID;
                DocLink.Insert;

                //Create Xml Document
                CashManagementSetup.Get;
                  if DocLines.Find('-') then begin
                    XmlFileName:='C:\Data\'+DocNo+'.xml';
                    FileName :='C:\Data\'+Docname+'.xml';
                    //FileName :=Docname+'.xml';
                       //if IsNull(  //xmlWriter) then
                      //xmlWriter :=   //xmlWriter.XmlTextWriter(XmlFileName, EncodingText.UTF8);
                      //xmlWriter.WriteStartDocument();
                    //Create Parent element
                      //xmlWriter.WriteStartElement('Columns');
                      //xmlWriter.WriteStartElement('Params');
                      //xmlWriter.WriteElementString('Library',CashManagementSetup."SharePoint Site Main Library");
                      //xmlWriter.WriteElementString('Region',Region);
                      //xmlWriter.WriteElementString('Folder',CashManagementSetup."SharePoint Document Library"+'/'+Region+'/'+CashManagementSetup."SharePoint Document Library"+'/'+Docname);
                      //xmlWriter.WriteEndElement();
                      //xmlWriter.WriteStartElement('Files');
                      //xmlWriter.WriteElementString('Filename',FileDesc);
                      //xmlWriter.WriteEndElement();
                     //Region Metadata
                      //xmlWriter.WriteStartElement('Column');
                    // REPEAT
                    //Create Child elements
                      //xmlWriter.WriteElementString('Title','Region');
                      //xmlWriter.WriteElementString('Value',Region);
                    //End writing top element and XML document
                      //xmlWriter.WriteEndElement();
                   //Constituency Metadata
                      //xmlWriter.WriteStartElement('Column');
                      //xmlWriter.WriteElementString('Title','Constituency');
                      //xmlWriter.WriteElementString('Value','');
                      //xmlWriter.WriteEndElement();
                    //Employee Metadata
                      //xmlWriter.WriteStartElement('Column');
                      //xmlWriter.WriteElementString('Title','Employee');
                      //xmlWriter.WriteElementString('Value',UserId);
                      //xmlWriter.WriteEndElement();
                      //xmlWriter.WriteEndDocument();
                      //xmlWriter.Close();
                    end;
                   //  // Filer.CopyClientFile(FileName,'X:\'+Docname+'.xml',TRUE);
                      //Filer.MoveFile(FileName,'X:\'+Docname+'.xml');
                    end;
                Message('Documents Uploaded Successffully');

    end;

    procedure UploadICTHelpDeskDocuments(DocNo: Code[50];DocDesc: Text;TabID: RecordID;Region: Code[100]): Boolean
    var
        DocType: Record "DMS Documents";
        DocLines: Record CBRECEIPTS;
        FileName: Text[250];
          //xmlWriter: dotnet XmlTextWriter;
          //EncodingText: dotnet Encoding;
    begin
                CashManagementSetup.Get;
              if CashManagementSetup.Find('-') then begin
                //Uploade File to folder
                Docname:=DocNo;
                Docname:=ConvertStr(Docname,':','_');
                Docname:=ConvertStr(Docname,':','_');
                  //FileName:=Filer.OpenFileDialog('Select Document To Upload','Select Document To Upload','PDF Files (*.PDF)|*.PDF|All files (*.*)|*.*');
                FileName2:='C:\Data\'+Docname+'_'+Filer.GetFileName(FileName);
                  //FileDesc:=Docname+'_'+Filer.GetFileName(FileName);
                 // Filer.CopyClientFile(FileName,FileName2,true);
                  //Filer.MoveFile(FileName2,'X:\'+FileDesc);
               // CopyClientFile(FileName,'X:\'+FileName2,TRUE);
                //Insert Link
                DocLink.Init;
                DocLink."Link ID":=0;
                DocLink.URL1:=DocType."Sharepoint URL"+FileDesc;
                DocLink.Description:=FileDesc;
                DocLink.Type:=DocLink.Type::Link;
                DocLink.Company:=COMPANYNAME;
                DocLink."User ID":=UserId;
                DocLink.Created:=CreateDatetime(Today,Time);
                DocLink."Record ID":=TabID;
                DocLink.Insert;

                //Create Xml Document
                CashManagementSetup.Get;
                  if DocLines.Find('-') then begin
                    XmlFileName:='C:\Data\'+DocNo+'.xml';
                    FileName :='C:\Data\'+Docname+'.xml';
                    //FileName :=Docname+'.xml';
                       //if IsNull(  //xmlWriter) then
                      //xmlWriter :=   //xmlWriter.XmlTextWriter(XmlFileName, EncodingText.UTF8);
                      //xmlWriter.WriteStartDocument();
                    //Create Parent element
                      //xmlWriter.WriteStartElement('Columns');
                      //xmlWriter.WriteStartElement('Params');
                      //xmlWriter.WriteElementString('Library',CashManagementSetup."SharePoint Site Main Library");
                      //xmlWriter.WriteElementString('Region',Region);
                      //xmlWriter.WriteElementString('Folder',CashManagementSetup."SharePoint Document Library"+'/'+Region+'/'+CashManagementSetup."SharePoint Document Library"+'/'+Docname);
                      //xmlWriter.WriteEndElement();
                      //xmlWriter.WriteStartElement('Files');
                      //xmlWriter.WriteElementString('Filename',FileDesc);
                      //xmlWriter.WriteEndElement();
                     //Region Metadata
                      //xmlWriter.WriteStartElement('Column');
                    // REPEAT
                    //Create Child elements
                      //xmlWriter.WriteElementString('Title','Region');
                      //xmlWriter.WriteElementString('Value',Region);
                    //End writing top element and XML document
                      //xmlWriter.WriteEndElement();
                   //Constituency Metadata
                      //xmlWriter.WriteStartElement('Column');
                      //xmlWriter.WriteElementString('Title','Constituency');
                      //xmlWriter.WriteElementString('Value','');
                      //xmlWriter.WriteEndElement();
                    //Employee Metadata
                      //xmlWriter.WriteStartElement('Column');
                      //xmlWriter.WriteElementString('Title','Employee');
                      //xmlWriter.WriteElementString('Value',UserId);
                      //xmlWriter.WriteEndElement();
                      //xmlWriter.WriteEndDocument();
                      //xmlWriter.Close();
                    end;
                   //  // Filer.CopyClientFile(FileName,'X:\'+Docname+'.xml',TRUE);
                      //Filer.MoveFile(FileName,'X:\'+Docname+'.xml');
                    end;
                Message('Documents Uploaded Successffully');

    end;

    procedure UploadSalaryVoucherDocuments(DocNo: Code[50];DocDesc: Text;TabID: RecordID;Region: Code[100]): Boolean
    var
        DocType: Record "DMS Documents";
        DocLines: Record CBRECEIPTS;
        FileName: Text[250];
          //xmlWriter: dotnet XmlTextWriter;
          //EncodingText: dotnet Encoding;
    begin
          CashManagementSetup.Get;
              if CashManagementSetup.Find('-') then begin
                //Uploade File to folder
                Docname:=DocNo;
                Docname:=ConvertStr(Docname,':','_');
                Docname:=ConvertStr(Docname,':','_');
                  //FileName:=Filer.OpenFileDialog('Select Document To Upload','Select Document To Upload','PDF Files (*.PDF)|*.PDF|All files (*.*)|*.*');
                  //FileName2:='\\192.168.0.86\DocumentsPath\'+Docname+'_'+Filer.GetFileName(FileName);
                  //FileDesc:=Docname+'_'+Filer.GetFileName(FileName);
                 // Filer.CopyClientFile(FileName,FileName2,true);
                  //Filer.MoveFile(FileName2,'\\192.168.0.86\DocumentsPath\'+FileDesc);
               // CopyClientFile(FileName,'X:\'+FileName2,TRUE);
                //Insert Link
                DocLink.Init;
                DocLink."Link ID":=0;
                DocLink.URL1:=CashManagementSetup."SharePoint Site Link"+'/'+CashManagementSetup."SharePoint Site Main Library"+'/'+CashManagementSetup."SharePoint Document Library"+'/'
                +CashManagementSetup."Salary Voucher DMS Link"+'/'+Docname+'/'+FileDesc;
                DocLink.Description:=FileDesc;
                DocLink.Type:=DocLink.Type::Link;
                DocLink.Company:=COMPANYNAME;
                DocLink."User ID":=UserId;
                DocLink.Created:=CreateDatetime(Today,Time);
                DocLink."Record ID":=TabID;
                DocLink.Insert;
                //Create Xml Document
                CashManagementSetup.Get;
                  if DocLines.Find('-') then begin
                     XmlFileName:='C:\Data\'+DocNo+'.xml';
                     FileName:=  'C:\Data\'+Docname+'.xml';
                    //FileName :=Docname+'.xml';
                       //if IsNull(  //xmlWriter) then
                      //xmlWriter :=   //xmlWriter.XmlTextWriter(XmlFileName, EncodingText.UTF8);
                      //xmlWriter.WriteStartDocument();
                    //Create Parent element
                      //xmlWriter.WriteStartElement('Columns');
                      //xmlWriter.WriteStartElement('Params');
                      //xmlWriter.WriteElementString('Library',CashManagementSetup."SharePoint Site Main Library");
                      //xmlWriter.WriteElementString('Region',Region);
                      //xmlWriter.WriteElementString('Folder',CashManagementSetup."SharePoint Document Library"+'/'+Region+'/'+CashManagementSetup."Salary Voucher DMS Link"+'/'+Docname);
                      //xmlWriter.WriteEndElement();
                      //xmlWriter.WriteStartElement('Files');
                      //xmlWriter.WriteElementString('Filename',FileDesc);
                      //xmlWriter.WriteEndElement();
                     //Region Metadata
                      //xmlWriter.WriteStartElement('Column');
                    // REPEAT
                    //Create Child elements
                      //xmlWriter.WriteElementString('Title','Region');
                      //xmlWriter.WriteElementString('Value',Region);
                    //End writing top element and XML document
                      //xmlWriter.WriteEndElement();
                   //Constituency Metadata
                      //xmlWriter.WriteStartElement('Column');
                      //xmlWriter.WriteElementString('Title','Constituency');
                      //xmlWriter.WriteElementString('Value','');
                      //xmlWriter.WriteEndElement();
                    //Employee Metadata
                      //xmlWriter.WriteStartElement('Column');
                      //xmlWriter.WriteElementString('Title','Employee');
                      //xmlWriter.WriteElementString('Value',UserId);
                      //xmlWriter.WriteEndElement();
                      //xmlWriter.WriteEndDocument();
                      //xmlWriter.Close();
                    end;
                   //  // Filer.CopyClientFile(FileName,'X:\'+Docname+'.xml',TRUE);
                      //Filer.MoveFile(FileName,'X:\'+Docname+'.xml');
                    end;
                 Message('Documents Uploaded Successffully');
    end;

    procedure UploadSalaryAdvanceDocuments(DocNo: Code[50];DocDesc: Text;TabID: RecordID;Region: Code[100]): Boolean
    var
        DocType: Record "DMS Documents";
        DocLines: Record CBRECEIPTS;
        FileName: Text[250];
          //xmlWriter: dotnet XmlTextWriter;
          //EncodingText: dotnet Encoding;
    begin
             CashManagementSetup.Get;
              if CashManagementSetup.Find('-') then begin
                //Uploade File to folder
                Docname:=DocNo;
                Docname:=ConvertStr(Docname,':','_');
                Docname:=ConvertStr(Docname,':','_');
                  //FileName:=Filer.OpenFileDialog('Select Document To Upload','Select Document To Upload','PDF Files (*.PDF)|*.PDF|All files (*.*)|*.*');
                  //FileName2:='\\192.168.0.86\DocumentsPath\'+Docname+'_'+Filer.GetFileName(FileName);
                  //FileDesc:=Docname+'_'+Filer.GetFileName(FileName);
                 // Filer.CopyClientFile(FileName,FileName2,true);
                  //Filer.MoveFile(FileName2,'\\192.168.0.86\DocumentsPath\'+FileDesc);
               // CopyClientFile(FileName,'X:\'+FileName2,TRUE);
                //Insert Link
                DocLink.Init;
                DocLink."Link ID":=0;
                DocLink.URL1:=CashManagementSetup."SharePoint Site Link"+'/'+CashManagementSetup."SharePoint Site Main Library"+'/'+CashManagementSetup."SharePoint Document Library"+'/'+CashManagementSetup."Salary Advance DMS Link"+'/'+
                Docname+'/'+FileDesc;
                DocLink.Description:=FileDesc;
                DocLink.Type:=DocLink.Type::Link;
                DocLink.Company:=COMPANYNAME;
                DocLink."User ID":=UserId;
                DocLink.Created:=CreateDatetime(Today,Time);
                DocLink."Record ID":=TabID;
                DocLink.Insert;

                //Create Xml Document

                CashManagementSetup.Get;
                  if DocLines.Find('-') then begin
                    XmlFileName:='\\192.168.0.86\DocumentsPath\'+DocNo+'.xml';
                    FileName :='\\192.168.0.86\DocumentsPath\'+Docname+'.xml';
                    //FileName :=Docname+'.xml';
                       //if IsNull(  //xmlWriter) then
                      //xmlWriter :=   //xmlWriter.XmlTextWriter(XmlFileName, EncodingText.UTF8);
                      //xmlWriter.WriteStartDocument();
                    //Create Parent element
                      //xmlWriter.WriteStartElement('Columns');
                      //xmlWriter.WriteStartElement('Params');
                      //xmlWriter.WriteElementString('Library',CashManagementSetup."SharePoint Site Main Library");
                    //  //xmlWriter.WriteElementString('Region',region);
                      //xmlWriter.WriteElementString('Folder',CashManagementSetup."SharePoint Document Library"+'/'+CashManagementSetup."Salary Advance DMS Link"+'/'+Docname);
                      //xmlWriter.WriteEndElement();
                      //xmlWriter.WriteStartElement('Files');
                      //xmlWriter.WriteElementString('Filename',FileDesc);
                      //xmlWriter.WriteEndElement();
                     //Region Metadata
                      //xmlWriter.WriteStartElement('Column');
                    // REPEAT
                    //Create Child elements
                    //  //xmlWriter.WriteElementString('Title','Region');
                    //  //xmlWriter.WriteElementString('Value',region);
                    //End writing top element and XML document
                      //xmlWriter.WriteEndElement();
                   //Constituency Metadata
                      //xmlWriter.WriteStartElement('Column');
                      //xmlWriter.WriteElementString('Title','Constituency');
                      //xmlWriter.WriteElementString('Value','');
                      //xmlWriter.WriteEndElement();
                    //Employee Metadata
                      //xmlWriter.WriteStartElement('Column');
                      //xmlWriter.WriteElementString('Title','Employee');
                      //xmlWriter.WriteElementString('Value',UserId);
                      //xmlWriter.WriteEndElement();
                      //xmlWriter.WriteEndDocument();
                      //xmlWriter.Close();
                    end;
                   //  // Filer.CopyClientFile(FileName,'X:\'+Docname+'.xml',TRUE);
                      //Filer.MoveFile(FileName,'\\192.168.0.86\DocumentsPath\'+Docname+'.xml');
                    end;


            Message('Documents Uploaded Successffully');

    end;

    procedure UploadcarloanDocuments(DocNo: Code[50];DocDesc: Text;TabID: RecordID;Region: Code[100]): Boolean
    var
        DocType: Record "DMS Documents";
        DocLines: Record CBRECEIPTS;
        FileName: Text[250];
          //xmlWriter: dotnet XmlTextWriter;
          //EncodingText: dotnet Encoding;
    begin
          CashManagementSetup.Get;
              if CashManagementSetup.Find('-') then begin
                //Uploade File to folder
                Docname:=DocNo;
                Docname:=ConvertStr(Docname,':','_');
                Docname:=ConvertStr(Docname,':','_');
                  //FileName:=Filer.OpenFileDialog('Select Document To Upload','Select Document To Upload','PDF Files (*.PDF)|*.PDF|All files (*.*)|*.*');
                  //FileName2:='\\192.168.0.86\DocumentsPath\'+Docname+'_'+Filer.GetFileName(FileName);
                  //FileDesc:=Docname+'_'+Filer.GetFileName(FileName);
                 // Filer.CopyClientFile(FileName,FileName2,true);
                  //Filer.MoveFile(FileName2,'\\192.168.0.86\DocumentsPath\'+FileDesc);
               // CopyClientFile(FileName,'X:\'+FileName2,TRUE);
                //Insert Link
                DocLink.Init;
                DocLink."Link ID":=0;
                DocLink.URL1:=CashManagementSetup."SharePoint Site Link"+'/'+CashManagementSetup."SharePoint Site Main Library"+'/'+CashManagementSetup."SharePoint Document Library"+'/'+CashManagementSetup."Car Loan DMS Link"+'/'+
                Docname+'/'+FileDesc;
                DocLink.Description:=FileDesc;
                DocLink.Type:=DocLink.Type::Link;
                DocLink.Company:=COMPANYNAME;
                DocLink."User ID":=UserId;
                DocLink.Created:=CreateDatetime(Today,Time);
                DocLink."Record ID":=TabID;
                DocLink.Insert;

                //Create Xml Document
                CashManagementSetup.Reset;
                CashManagementSetup.Get;
                  if DocLines.Find('-') then begin
                    XmlFileName:='\\192.168.0.86\DocumentsPath\'+DocNo+'.xml';
                    FileName :='\\192.168.0.86\DocumentsPath\'+Docname+'.xml';
                    //FileName :=Docname+'.xml';
                       //if IsNull(  //xmlWriter) then
                      //xmlWriter :=   //xmlWriter.XmlTextWriter(XmlFileName, EncodingText.UTF8);
                      //xmlWriter.WriteStartDocument();
                    //Create Parent element
                      //xmlWriter.WriteStartElement('Columns');
                      //xmlWriter.WriteStartElement('Params');
                      //xmlWriter.WriteElementString('Library',CashManagementSetup."SharePoint Site Main Library");
                    //  //xmlWriter.WriteElementString('Region',region);
                      //xmlWriter.WriteElementString('Folder',CashManagementSetup."SharePoint Document Library"+'/'+CashManagementSetup."Car Loan DMS Link"+'/'+Docname);
                      //xmlWriter.WriteEndElement();
                      //xmlWriter.WriteStartElement('Files');
                      //xmlWriter.WriteElementString('Filename',FileDesc);
                      //xmlWriter.WriteEndElement();
                     //Region Metadata
                      //xmlWriter.WriteStartElement('Column');
                    // REPEAT
                    //Create Child elements
                    //  //xmlWriter.WriteElementString('Title','Region');
                    //  //xmlWriter.WriteElementString('Value',region);
                    //End writing top element and XML document
                      //xmlWriter.WriteEndElement();
                   //Constituency Metadata
                      //xmlWriter.WriteStartElement('Column');
                      //xmlWriter.WriteElementString('Title','Constituency');
                      //xmlWriter.WriteElementString('Value','');
                      //xmlWriter.WriteEndElement();
                    //Employee Metadata
                      //xmlWriter.WriteStartElement('Column');
                      //xmlWriter.WriteElementString('Title','Employee');
                      //xmlWriter.WriteElementString('Value',UserId);
                      //xmlWriter.WriteEndElement();
                      //xmlWriter.WriteEndDocument();
                      //xmlWriter.Close();
                    end;
                   //  // Filer.CopyClientFile(FileName,'X:\'+Docname+'.xml',TRUE);
                      //Filer.MoveFile(FileName,'\\192.168.0.86\DocumentsPath\'+Docname+'.xml');
                    end;


            Message('Documents Uploaded Successffully');
    end;

    procedure UploadInspectionDocuments(DocNo: Code[50];DocDesc: Text;TabID: RecordID;Region: Code[100]): Boolean
    var
        DocType: Record "DMS Documents";
        DocLines: Record CBRECEIPTS;
        FileName: Text[250];
          //xmlWriter: dotnet XmlTextWriter;
          //EncodingText: dotnet Encoding;
    begin
                CashManagementSetup.Get;
              if CashManagementSetup.Find('-') then begin
                //Uploade File to folder
                Docname:=DocNo;
                Docname:=ConvertStr(Docname,':','_');
                Docname:=ConvertStr(Docname,':','_');
                  //FileName:=Filer.OpenFileDialog('Select Document To Upload','Select Document To Upload','PDF Files (*.PDF)|*.PDF|All files (*.*)|*.*');
                  //FileName2:='\\192.168.0.86\DocumentsPath\'+Docname+'_'+Filer.GetFileName(FileName);
                  //FileDesc:=Docname+'_'+Filer.GetFileName(FileName);
                 // Filer.CopyClientFile(FileName,FileName2,true);
                  //Filer.MoveFile(FileName2,'\\192.168.0.86\DocumentsPath\'+FileDesc);
               // CopyClientFile(FileName,'X:\'+FileName2,TRUE);
                //Insert Link
                DocLink.Init;
                DocLink."Link ID":=0;
                DocLink.URL1:=CashManagementSetup."SharePoint Site Link"+'/'+CashManagementSetup."SharePoint Site Main Library"+'/'+CashManagementSetup."SharePoint Document Library"+
                '/'+CashManagementSetup."Petty Cash Voucher DMS Link"+'/'+Docname+'/'+FileDesc;
                DocLink.Description:=FileDesc;
                DocLink.Type:=DocLink.Type::Link;
                DocLink.Company:=COMPANYNAME;
                DocLink."User ID":=UserId;
                DocLink.Created:=CreateDatetime(Today,Time);
                DocLink."Record ID":=TabID;
                DocLink.Insert;

                //Create Xml Document
                 CashManagementSetup.Get;
                  if DocLines.Find('-') then begin
                    XmlFileName:='\\192.168.0.86\DocumentsPath\'+DocNo+'.xml';
                    FileName :='\\192.168.0.86\DocumentsPath\'+Docname+'.xml';
                    //FileName :=Docname+'.xml';
                       //if IsNull(  //xmlWriter) then
                      //xmlWriter :=   //xmlWriter.XmlTextWriter(XmlFileName, EncodingText.UTF8);
                      //xmlWriter.WriteStartDocument();
                    //Create Parent element
                      //xmlWriter.WriteStartElement('Columns');
                      //xmlWriter.WriteStartElement('Params');
                      //xmlWriter.WriteElementString('Library',CashManagementSetup."SharePoint Site Main Library");
                      //xmlWriter.WriteElementString('Region',Region);
                      //xmlWriter.WriteElementString('Folder',CashManagementSetup."SharePoint Document Library"+'/'+Region+'/'+CashManagementSetup."SharePoint Document Library"+'/'+Docname);
                      //xmlWriter.WriteEndElement();
                      //xmlWriter.WriteStartElement('Files');
                      //xmlWriter.WriteElementString('Filename',FileDesc);
                      //xmlWriter.WriteEndElement();
                     //Region Metadata
                      //xmlWriter.WriteStartElement('Column');
                    // REPEAT
                    //Create Child elements
                      //xmlWriter.WriteElementString('Title','Region');
                      //xmlWriter.WriteElementString('Value',Region);
                    //End writing top element and XML document
                      //xmlWriter.WriteEndElement();
                   //Constituency Metadata
                      //xmlWriter.WriteStartElement('Column');
                      //xmlWriter.WriteElementString('Title','Constituency');
                      //xmlWriter.WriteElementString('Value','');
                      //xmlWriter.WriteEndElement();
                    //Employee Metadata
                      //xmlWriter.WriteStartElement('Column');
                      //xmlWriter.WriteElementString('Title','Employee');
                      //xmlWriter.WriteElementString('Value',UserId);
                      //xmlWriter.WriteEndElement();
                      //xmlWriter.WriteEndDocument();
                      //xmlWriter.Close();
                    end;
                   //  // Filer.CopyClientFile(FileName,'X:\'+Docname+'.xml',TRUE);
                      //Filer.MoveFile(FileName,'\\192.168.0.86\DocumentsPath\'+Docname+'.xml');
                    end;
                Message('Documents Uploaded Successffully');

    end;

    procedure UploadStandardinspectionDocuments(DocNo: Code[50];DocDesc: Text;TabID: RecordID): Boolean
    var
        DocType: Record "DMS Documents";
        DocLines: Record CBRECEIPTS;
        FileName: Text[250];
          //xmlWriter: dotnet XmlTextWriter;
          //EncodingText: dotnet Encoding;
    begin
              CashManagementSetup.Get;
              if CashManagementSetup.Find('-') then begin
                //Uploade File to folder
                 Docname:=DocNo;
                 Docname:=ConvertStr(Docname,':','_');
                 Docname:=ConvertStr(Docname,':','_');
                   //FileName:=Filer.OpenFileDialog('Select Document To Upload','Select Document To Upload','PDF Files (*.PDF)|*.PDF|All files (*.*)|*.*');
                   //FileName2:='\\192.168.0.95\DocumentsPath\'+Docname+'_'+Filer.GetFileName(FileName);
                  //FileDesc:=Docname+'_'+Filer.GetFileName(FileName);
                 // Filer.CopyClientFile(FileName,FileName2,true);
                  //Filer.MoveFile(FileName2,'\\192.168.0.86\DocumentsPath\'+FileDesc);
               // CopyClientFile(FileName,'X:\'+FileName2,TRUE);
                //Insert Link
                DocLink.Init;
                DocLink."Link ID":=0;
                DocLink.URL1:=CashManagementSetup."SharePoint Site Link"+'/'+CashManagementSetup."SharePoint Site Main Library"+'/'+CashManagementSetup."SharePoint Document Library"+'/'+CashManagementSetup."Inspection DMS Link"+'/'+Docname+'/'+FileDesc;
                DocLink.Description:=FileDesc;
                DocLink.Type:=DocLink.Type::Link;
                DocLink.Company:=COMPANYNAME;
                DocLink."User ID":=UserId;
                DocLink.Created:=CreateDatetime(Today,Time);
                DocLink."Record ID":=TabID;
                DocLink.Insert;

                //Create Xml Document
                  CashManagementSetup.Get;
                  if CashManagementSetup.Find('-') then begin
                    XmlFileName:='\\192.168.0.86\DocumentsPath\'+Docname+'.xml';
                    FileName :='\\192.168.0.86\DocumentsPath\'+Docname+'.xml';
                    //FileName :=Docname+'.xml';
                       //if IsNull(  //xmlWriter) then
                      //xmlWriter :=   //xmlWriter.XmlTextWriter(XmlFileName, EncodingText.UTF8);
                      //xmlWriter.WriteStartDocument();
                    //Create Parent element
                      //xmlWriter.WriteStartElement('Columns');
                      //xmlWriter.WriteStartElement('Params');
                      //xmlWriter.WriteElementString('Library',CashManagementSetup."SharePoint Site Main Library");
                      //xmlWriter.WriteElementString('Folder',CashManagementSetup."SharePoint Document Library"+'/'+CashManagementSetup."Inspection DMS Link"+'/'+Docname);
                      //xmlWriter.WriteEndElement();
                      //xmlWriter.WriteStartElement('Files');
                      //xmlWriter.WriteElementString('Filename',FileDesc);
                      //xmlWriter.WriteEndElement();
                     //Region Metadata
                      //xmlWriter.WriteStartElement('Column');
                    // REPEAT
                    //Create Child elements
                      //xmlWriter.WriteElementString('Title','Region');
                      //xmlWriter.WriteElementString('Value','');
                    //   //xmlWriter.WriteEndElement();
                    // UNTIL DocLines.NEXT = 0;
                    //End writing top element and XML document
                      //xmlWriter.WriteEndElement();
                   //Constituency Metadata
                      //xmlWriter.WriteStartElement('Column');
                      //xmlWriter.WriteElementString('Title','Constituency');
                      //xmlWriter.WriteElementString('Value','');
                      //xmlWriter.WriteEndElement();
                    //Employee Metadata
                      //xmlWriter.WriteStartElement('Column');
                      //xmlWriter.WriteElementString('Title','Employee');
                      //xmlWriter.WriteElementString('Value',UserId);
                      //xmlWriter.WriteEndElement();
                      //xmlWriter.WriteEndDocument();
                      //xmlWriter.Close();
                    end;
                   //  // Filer.CopyClientFile(FileName,'X:\'+Docname+'.xml',TRUE);
                      //Filer.MoveFile(FileName,'\\192.168.0.86\DocumentsPath\'+Docname+'.xml');
                    end;
                  Message('Documents Uploaded Successffully');

    end;

    procedure FnUploadPurchaseInvoiceDocuments(DocNo: Code[50];DocDesc: Text;TabID: RecordID): Boolean
    var
        DocType: Record "DMS Documents";
        DocLines: Record CBRECEIPTS;
        FileName: Text[250];
          //xmlWriter: dotnet XmlTextWriter;
          //EncodingText: dotnet Encoding;
    begin
               CashManagementSetup.Get;
              if CashManagementSetup.Find('-') then begin
                //Uploade File to folder
                Docname:=DocNo;
                Docname:=ConvertStr(Docname,':','_');
                Docname:=ConvertStr(Docname,':','_');
                  //FileName:=Filer.OpenFileDialog('Select Document To Upload','Select Document To Upload','PDF Files (*.PDF)|*.PDF|All files (*.*)|*.*');
                  //FileName2:='\\192.168.0.86\DocumentsPath\'+Docname+'_'+Filer.GetFileName(FileName);
                  //FileDesc:=Docname+'_'+Filer.GetFileName(FileName);
                 // Filer.CopyClientFile(FileName,FileName2,true);
                  //Filer.MoveFile(FileName2,'\\192.168.0.86\DocumentsPath\'+FileDesc);
               // CopyClientFile(FileName,'X:\'+FileName2,TRUE);
                //Insert Link
                DocLink.Init;
                DocLink."Link ID":=0;
                DocLink.URL1:=CashManagementSetup."SharePoint Site Link"+'/'+CashManagementSetup."SharePoint Site Main Library"+'/'+CashManagementSetup."SharePoint Document Library"+'/'+CashManagementSetup."Purchase Invoice DMS Link"+'/'+
                Docname+'/'+FileDesc;
                DocLink.Description:=FileDesc;
                DocLink.Type:=DocLink.Type::Link;
                DocLink.Company:=COMPANYNAME;
                DocLink."User ID":=UserId;
                DocLink.Created:=CreateDatetime(Today,Time);
                DocLink."Record ID":=TabID;
                DocLink.Insert;

                //Create Xml Document
                CashManagementSetup.Reset;
                CashManagementSetup.Get;
                  if DocLines.Find('-') then begin
                    XmlFileName:='\\192.168.0.86\DocumentsPath\'+DocNo+'.xml';
                    FileName :='\\192.168.0.86\DocumentsPath\'+Docname+'.xml';
                    //FileName :=Docname+'.xml';
                       //if IsNull(  //xmlWriter) then
                      //xmlWriter :=   //xmlWriter.XmlTextWriter(XmlFileName, EncodingText.UTF8);
                      //xmlWriter.WriteStartDocument();
                    //Create Parent element
                      //xmlWriter.WriteStartElement('Columns');
                      //xmlWriter.WriteStartElement('Params');
                      //xmlWriter.WriteElementString('Library',CashManagementSetup."SharePoint Site Main Library");
                    //  //xmlWriter.WriteElementString('Region',region);
                      //xmlWriter.WriteElementString('Folder',CashManagementSetup."SharePoint Document Library"+'/'+CashManagementSetup."Purchase Invoice DMS Link"+'/'+Docname);
                      //xmlWriter.WriteEndElement();
                      //xmlWriter.WriteStartElement('Files');
                      //xmlWriter.WriteElementString('Filename',FileDesc);
                      //xmlWriter.WriteEndElement();
                     //Region Metadata
                      //xmlWriter.WriteStartElement('Column');
                    // REPEAT
                    //Create Child elements
                    //  //xmlWriter.WriteElementString('Title','Region');
                    //  //xmlWriter.WriteElementString('Value',region);
                    //End writing top element and XML document
                      //xmlWriter.WriteEndElement();
                   //Constituency Metadata
                      //xmlWriter.WriteStartElement('Column');
                      //xmlWriter.WriteElementString('Title','Constituency');
                      //xmlWriter.WriteElementString('Value','');
                      //xmlWriter.WriteEndElement();
                    //Employee Metadata
                      //xmlWriter.WriteStartElement('Column');
                      //xmlWriter.WriteElementString('Title','Employee');
                      //xmlWriter.WriteElementString('Value',UserId);
                      //xmlWriter.WriteEndElement();
                      //xmlWriter.WriteEndDocument();
                      //xmlWriter.Close();
                    end;
                   //  // Filer.CopyClientFile(FileName,'X:\'+Docname+'.xml',TRUE);
                      //Filer.MoveFile(FileName,'\\192.168.0.86\DocumentsPath\'+Docname+'.xml');
                    end;


            Message('Documents Uploaded Successffully');

    end;

    procedure FnUploaRMFDocuments(DocNo: Code[50];DocDesc: Text;TabID: RecordID): Boolean
    var
        DocType: Record "DMS Documents";
        DocLines: Record CBRECEIPTS;
        FileName: Text[250];
          //xmlWriter: dotnet XmlTextWriter;
          //EncodingText: dotnet Encoding;
    begin
               CashManagementSetup.Get;
              if CashManagementSetup.Find('-') then begin
                //Uploade File to folder
                Docname:=DocNo;
                Docname:=ConvertStr(Docname,':','_');
                Docname:=ConvertStr(Docname,':','_');
                  //FileName:=Filer.OpenFileDialog('Select Document To Upload','Select Document To Upload','PDF Files (*.PDF)|*.PDF|All files (*.*)|*.*');
                  //FileName2:='\\192.168.0.86\DocumentsPath\'+Docname+'_'+Filer.GetFileName(FileName);
                  //FileDesc:=Docname+'_'+Filer.GetFileName(FileName);
                 // Filer.CopyClientFile(FileName,FileName2,true);
                  //Filer.MoveFile(FileName2,'\\192.168.0.86\DocumentsPath\'+FileDesc);
               // CopyClientFile(FileName,'X:\'+FileName2,TRUE);
                //Insert Link
                DocLink.Init;
                DocLink."Link ID":=0;
                DocLink.URL1:=CashManagementSetup."SharePoint Site Link"+'/'+CashManagementSetup."SharePoint Site Main Library"+'/'+CashManagementSetup."SharePoint Document Library"+'/'+CashManagementSetup."Purchase Invoice DMS Link"+'/'+
                Docname+'/'+FileDesc;
                DocLink.Description:=FileDesc;
                DocLink.Type:=DocLink.Type::Link;
                DocLink.Company:=COMPANYNAME;
                DocLink."User ID":=UserId;
                DocLink.Created:=CreateDatetime(Today,Time);
                DocLink."Record ID":=TabID;
                DocLink.Insert;

                //Create Xml Document
                CashManagementSetup.Reset;
                CashManagementSetup.Get;
                  if DocLines.Find('-') then begin
                    XmlFileName:='\\192.168.0.86\DocumentsPath\'+DocNo+'.xml';
                    FileName :='\\192.168.0.86\DocumentsPath\'+Docname+'.xml';
                    //FileName :=Docname+'.xml';
                       //if IsNull(  //xmlWriter) then
                      //xmlWriter :=   //xmlWriter.XmlTextWriter(XmlFileName, EncodingText.UTF8);
                      //xmlWriter.WriteStartDocument();
                    //Create Parent element
                      //xmlWriter.WriteStartElement('Columns');
                      //xmlWriter.WriteStartElement('Params');
                      //xmlWriter.WriteElementString('Library',CashManagementSetup."SharePoint Site Main Library");
                    //  //xmlWriter.WriteElementString('Region',region);
                      //xmlWriter.WriteElementString('Folder',CashManagementSetup."SharePoint Document Library"+'/'+CashManagementSetup."Purchase Invoice DMS Link"+'/'+Docname);
                      //xmlWriter.WriteEndElement();
                      //xmlWriter.WriteStartElement('Files');
                      //xmlWriter.WriteElementString('Filename',FileDesc);
                      //xmlWriter.WriteEndElement();
                     //Region Metadata
                      //xmlWriter.WriteStartElement('Column');
                    // REPEAT
                    //Create Child elements
                    //  //xmlWriter.WriteElementString('Title','Region');
                    //  //xmlWriter.WriteElementString('Value',region);
                    //End writing top element and XML document
                      //xmlWriter.WriteEndElement();
                   //Constituency Metadata
                      //xmlWriter.WriteStartElement('Column');
                      //xmlWriter.WriteElementString('Title','Constituency');
                      //xmlWriter.WriteElementString('Value','');
                      //xmlWriter.WriteEndElement();
                    //Employee Metadata
                      //xmlWriter.WriteStartElement('Column');
                      //xmlWriter.WriteElementString('Title','Employee');
                      //xmlWriter.WriteElementString('Value',UserId);
                      //xmlWriter.WriteEndElement();
                      //xmlWriter.WriteEndDocument();
                      //xmlWriter.Close();
                    end;
                   //  // Filer.CopyClientFile(FileName,'X:\'+Docname+'.xml',TRUE);
                      //Filer.MoveFile(FileName,'\\192.168.0.86\DocumentsPath\'+Docname+'.xml');
                    end;


            Message('Documents Uploaded Successffully');

    end;

    procedure FnUploaIACharterDocuments(DocNo: Code[50];DocDesc: Text;TabID: RecordID): Boolean
    var
        DocType: Record "DMS Documents";
        DocLines: Record CBRECEIPTS;
        FileName: Text[250];
          //xmlWriter: dotnet XmlTextWriter;
          //EncodingText: dotnet Encoding;
    begin
               CashManagementSetup.Get;
              if CashManagementSetup.Find('-') then begin
                //Uploade File to folder
                Docname:=DocNo;
                Docname:=ConvertStr(Docname,':','_');
                Docname:=ConvertStr(Docname,':','_');
                  //FileName:=Filer.OpenFileDialog('Select Document To Upload','Select Document To Upload','PDF Files (*.PDF)|*.PDF|All files (*.*)|*.*');
                  //FileName2:='\\192.168.0.86\DocumentsPath\'+Docname+'_'+Filer.GetFileName(FileName);
                  //FileDesc:=Docname+'_'+Filer.GetFileName(FileName);
                 // Filer.CopyClientFile(FileName,FileName2,true);
                  //Filer.MoveFile(FileName2,'\\192.168.0.86\DocumentsPath\'+FileDesc);
               // CopyClientFile(FileName,'X:\'+FileName2,TRUE);
                //Insert Link
                DocLink.Init;
                DocLink."Link ID":=0;
                DocLink.URL1:=CashManagementSetup."SharePoint Site Link"+'/'+CashManagementSetup."SharePoint Site Main Library"+'/'+CashManagementSetup."SharePoint Document Library"+'/'+CashManagementSetup."Purchase Invoice DMS Link"+'/'+
                Docname+'/'+FileDesc;
                DocLink.Description:=FileDesc;
                DocLink.Type:=DocLink.Type::Link;
                DocLink.Company:=COMPANYNAME;
                DocLink."User ID":=UserId;
                DocLink.Created:=CreateDatetime(Today,Time);
                DocLink."Record ID":=TabID;
                DocLink.Insert;

                //Create Xml Document
                CashManagementSetup.Reset;
                CashManagementSetup.Get;
                  if DocLines.Find('-') then begin
                    XmlFileName:='\\192.168.0.86\DocumentsPath\'+DocNo+'.xml';
                    FileName :='\\192.168.0.86\DocumentsPath\'+Docname+'.xml';
                    //FileName :=Docname+'.xml';
                       //if IsNull(  //xmlWriter) then
                      //xmlWriter :=   //xmlWriter.XmlTextWriter(XmlFileName, EncodingText.UTF8);
                      //xmlWriter.WriteStartDocument();
                    //Create Parent element
                      //xmlWriter.WriteStartElement('Columns');
                      //xmlWriter.WriteStartElement('Params');
                      //xmlWriter.WriteElementString('Library',CashManagementSetup."SharePoint Site Main Library");
                    //  //xmlWriter.WriteElementString('Region',region);
                      //xmlWriter.WriteElementString('Folder',CashManagementSetup."SharePoint Document Library"+'/'+CashManagementSetup."Purchase Invoice DMS Link"+'/'+Docname);
                      //xmlWriter.WriteEndElement();
                      //xmlWriter.WriteStartElement('Files');
                      //xmlWriter.WriteElementString('Filename',FileDesc);
                      //xmlWriter.WriteEndElement();
                     //Region Metadata
                      //xmlWriter.WriteStartElement('Column');
                    // REPEAT
                    //Create Child elements
                    //  //xmlWriter.WriteElementString('Title','Region');
                    //  //xmlWriter.WriteElementString('Value',region);
                    //End writing top element and XML document
                      //xmlWriter.WriteEndElement();
                   //Constituency Metadata
                      //xmlWriter.WriteStartElement('Column');
                      //xmlWriter.WriteElementString('Title','Constituency');
                      //xmlWriter.WriteElementString('Value','');
                      //xmlWriter.WriteEndElement();
                    //Employee Metadata
                      //xmlWriter.WriteStartElement('Column');
                      //xmlWriter.WriteElementString('Title','Employee');
                      //xmlWriter.WriteElementString('Value',UserId);
                      //xmlWriter.WriteEndElement();
                      //xmlWriter.WriteEndDocument();
                      //xmlWriter.Close();
                    end;
                   //  // Filer.CopyClientFile(FileName,'X:\'+Docname+'.xml',TRUE);
                      //Filer.MoveFile(FileName,'\\192.168.0.86\DocumentsPath\'+Docname+'.xml');
                    end;


            Message('Documents Uploaded Successffully');

    end;

    procedure FnUploadStudentDocuments(DocNo: Code[50];DocDesc: Text;TabID: RecordID): Boolean
    var
        DocType: Record "DMS Documents";
        DocLines: Record CBRECEIPTS;
        FileName: Text[250];
          //xmlWriter: dotnet XmlTextWriter;
          //EncodingText: dotnet Encoding;
    begin
              CashManagementSetup.Get;
              if CashManagementSetup.Find('-') then begin
                //Uploade File to folder
                 Docname:=DocNo;
                 Docname:=ConvertStr(Docname,':','_');
                 Docname:=ConvertStr(Docname,':','_');
                   //FileName:=Filer.OpenFileDialog('Select Document To Upload','Select Document To Upload','PDF Files (*.PDF)|*.PDF|All files (*.*)|*.*');
                   //FileName2:='\\192.168.0.95\DocumentsPath\'+Docname+'_'+Filer.GetFileName(FileName);
                  //FileDesc:=Docname+'_'+Filer.GetFileName(FileName);
                 // Filer.CopyClientFile(FileName,FileName2,true);
                  //Filer.MoveFile(FileName2,'\\192.168.0.86\DocumentsPath\'+FileDesc);
               // CopyClientFile(FileName,'X:\'+FileName2,TRUE);
                //Insert Link
                DocLink.Init;
                DocLink."Link ID":=0;
                DocLink.URL1:=CashManagementSetup."SharePoint Site Link"+'/'+CashManagementSetup."SharePoint Site Main Library"+'/'+CashManagementSetup."SharePoint Document Library"+'/'+CashManagementSetup."Student Docs DMS Link"+'/'+Docname+'/'+FileDesc;
                DocLink.Description:=FileDesc;
                DocLink.Type:=DocLink.Type::Link;
                DocLink.Company:=COMPANYNAME;
                DocLink."User ID":=UserId;
                DocLink.Created:=CreateDatetime(Today,Time);
                DocLink."Record ID":=TabID;
                DocLink.Insert;

                //Create Xml Document
                  CashManagementSetup.Get;
                  if CashManagementSetup.Find('-') then begin
                    XmlFileName:='\\192.168.0.86\DocumentsPath\'+Docname+'.xml';
                    FileName :='\\192.168.0.86\DocumentsPath\'+Docname+'.xml';
                    //FileName :=Docname+'.xml';
                       //if IsNull(  //xmlWriter) then
                      //xmlWriter :=   //xmlWriter.XmlTextWriter(XmlFileName, EncodingText.UTF8);
                      //xmlWriter.WriteStartDocument();
                    //Create Parent element
                      //xmlWriter.WriteStartElement('Columns');
                      //xmlWriter.WriteStartElement('Params');
                      //xmlWriter.WriteElementString('Library',CashManagementSetup."SharePoint Site Main Library");
                      //xmlWriter.WriteElementString('Folder',CashManagementSetup."Student Docs DMS Link"+'/'+Docname);
                      //xmlWriter.WriteEndElement();
                      //xmlWriter.WriteStartElement('Files');
                      //xmlWriter.WriteElementString('Filename',FileDesc);
                      //xmlWriter.WriteEndElement();
                     //Region Metadata
                      //xmlWriter.WriteStartElement('Column');
                    // REPEAT
                    //Create Child elements
                      //xmlWriter.WriteElementString('Title','Region');
                      //xmlWriter.WriteElementString('Value','');
                    //   //xmlWriter.WriteEndElement();
                    // UNTIL DocLines.NEXT = 0;
                    //End writing top element and XML document
                      //xmlWriter.WriteEndElement();
                   //Constituency Metadata
                      //xmlWriter.WriteStartElement('Column');
                      //xmlWriter.WriteElementString('Title','Constituency');
                      //xmlWriter.WriteElementString('Value','');
                      //xmlWriter.WriteEndElement();
                    //Employee Metadata
                      //xmlWriter.WriteStartElement('Column');
                      //xmlWriter.WriteElementString('Title','Employee');
                      //xmlWriter.WriteElementString('Value',UserId);
                      //xmlWriter.WriteEndElement();
                      //xmlWriter.WriteEndDocument();
                      //xmlWriter.Close();
                    end;
                   //  // Filer.CopyClientFile(FileName,'X:\'+Docname+'.xml',TRUE);
                      //Filer.MoveFile(FileName,'\\192.168.0.86\DocumentsPath\'+Docname+'.xml');
                    end;
                  Message('Documents Uploaded Successffully');

    end;

    procedure FnUploadPaymentVoucherDocs(DocNo: Code[50];DocDesc: Text;TabID: RecordID): Boolean
    var
        DocType: Record "DMS Documents";
        DocLines: Record CBRECEIPTS;
        FileName: Text[250];
          //xmlWriter: dotnet XmlTextWriter;
          //EncodingText: dotnet Encoding;
    begin
              CashManagementSetup.Get;
              if CashManagementSetup.Find('-') then begin
                //Uploade File to folder
                 Docname:=DocNo;
                 Docname:=ConvertStr(Docname,':','_');
                 Docname:=ConvertStr(Docname,':','_');
                   //FileName:=Filer.OpenFileDialog('Select Document To Upload','Select Document To Upload','PDF Files (*.PDF)|*.PDF|All files (*.*)|*.*');
                   //FileName2:='\\192.168.0.95\DocumentsPath\'+Docname+'_'+Filer.GetFileName(FileName);
                  //FileDesc:=Docname+'_'+Filer.GetFileName(FileName);
                 // Filer.CopyClientFile(FileName,FileName2,true);
                  //Filer.MoveFile(FileName2,'\\192.168.0.86\DocumentsPath\'+FileDesc);
               // CopyClientFile(FileName,'X:\'+FileName2,TRUE);
                //Insert Link
                DocLink.Init;
                DocLink."Link ID":=0;
                DocLink.URL1:=CashManagementSetup."SharePoint Site Link"+'/'+CashManagementSetup."SharePoint Site Main Library"+'/'+CashManagementSetup."SharePoint Document Library"+'/'+CashManagementSetup."Payment Voucher DMS Link"+'/'+
                Docname+'/'+FileDesc;
                DocLink.Description:=FileDesc;
                DocLink.Type:=DocLink.Type::Link;
                DocLink.Company:=COMPANYNAME;
                DocLink."User ID":=UserId;
                DocLink.Created:=CreateDatetime(Today,Time);
                DocLink."Record ID":=TabID;
                DocLink.Insert;

                //Create Xml Document
                  CashManagementSetup.Get;
                  if CashManagementSetup.Find('-') then begin
                    XmlFileName:='\\192.168.0.86\DocumentsPath\'+Docname+'.xml';
                    FileName :='\\192.168.0.86\DocumentsPath\'+Docname+'.xml';
                    //FileName :=Docname+'.xml';
                       //if IsNull(  //xmlWriter) then
                      //xmlWriter :=   //xmlWriter.XmlTextWriter(XmlFileName, EncodingText.UTF8);
                      //xmlWriter.WriteStartDocument();
                    //Create Parent element
                      //xmlWriter.WriteStartElement('Columns');
                      //xmlWriter.WriteStartElement('Params');
                      //xmlWriter.WriteElementString('Library',CashManagementSetup."SharePoint Site Main Library");
                      //xmlWriter.WriteElementString('Folder',CashManagementSetup."SharePoint Document Library"+'/'+CashManagementSetup."Payment Voucher DMS Link"+'/'+Docname);
                      //xmlWriter.WriteEndElement();
                      //xmlWriter.WriteStartElement('Files');
                      //xmlWriter.WriteElementString('Filename',FileDesc);
                      //xmlWriter.WriteEndElement();
                     //Region Metadata
                      //xmlWriter.WriteStartElement('Column');
                    // REPEAT
                    //Create Child elements
                      //xmlWriter.WriteElementString('Title','Region');
                      //xmlWriter.WriteElementString('Value','');
                    //   //xmlWriter.WriteEndElement();
                    // UNTIL DocLines.NEXT = 0;
                    //End writing top element and XML document
                      //xmlWriter.WriteEndElement();
                   //Constituency Metadata
                      //xmlWriter.WriteStartElement('Column');
                      //xmlWriter.WriteElementString('Title','Constituency');
                      //xmlWriter.WriteElementString('Value','');
                      //xmlWriter.WriteEndElement();
                    //Employee Metadata
                      //xmlWriter.WriteStartElement('Column');
                      //xmlWriter.WriteElementString('Title','Employee');
                      //xmlWriter.WriteElementString('Value',UserId);
                      //xmlWriter.WriteEndElement();
                      //xmlWriter.WriteEndDocument();
                      //xmlWriter.Close();
                    end;
                   //  // Filer.CopyClientFile(FileName,'X:\'+Docname+'.xml',TRUE);
                      //Filer.MoveFile(FileName,'\\192.168.0.86\DocumentsPath\'+Docname+'.xml');
                    end;
                  Message('Documents Uploaded Successffully');

    end;

    procedure FnUploadImprestMemoDocs(DocNo: Code[50];DocDesc: Text;TabID: RecordID): Boolean
    var
        DocType: Record "DMS Documents";
        DocLines: Record CBRECEIPTS;
        FileName: Text[250];
          //xmlWriter: dotnet XmlTextWriter;
          //EncodingText: dotnet Encoding;
    begin
              CashManagementSetup.Get;
              if CashManagementSetup.Find('-') then begin
                //Uploade File to folder
                 Docname:=DocNo;
                 Docname:=ConvertStr(Docname,':','_');
                 Docname:=ConvertStr(Docname,':','_');
                   //FileName:=Filer.OpenFileDialog('Select Document To Upload','Select Document To Upload','PDF Files (*.PDF)|*.PDF|All files (*.*)|*.*');
                   //FileName2:='\\192.168.0.95\DocumentsPath\'+Docname+'_'+Filer.GetFileName(FileName);
                  //FileDesc:=Docname+'_'+Filer.GetFileName(FileName);
                 // Filer.CopyClientFile(FileName,FileName2,true);
                  //Filer.MoveFile(FileName2,'\\192.168.0.86\DocumentsPath\'+FileDesc);
               // CopyClientFile(FileName,'X:\'+FileName2,TRUE);
                //Insert Link
                DocLink.Init;
                DocLink."Link ID":=0;
                DocLink.URL1:=CashManagementSetup."SharePoint Site Link"+'/'+CashManagementSetup."SharePoint Site Main Library"+'/'+CashManagementSetup."SharePoint Document Library"+'/'+CashManagementSetup."Imprest Memo DMS Link"+'/'+
                Docname+'/'+FileDesc;
                DocLink.Description:=FileDesc;
                DocLink.Type:=DocLink.Type::Link;
                DocLink.Company:=COMPANYNAME;
                DocLink."User ID":=UserId;
                DocLink.Created:=CreateDatetime(Today,Time);
                DocLink."Record ID":=TabID;
                DocLink.Insert;

                //Create Xml Document
                  CashManagementSetup.Get;
                  if CashManagementSetup.Find('-') then begin
                    XmlFileName:='\\192.168.0.86\DocumentsPath\'+Docname+'.xml';
                    FileName :='\\192.168.0.86\DocumentsPath\'+Docname+'.xml';
                    //FileName :=Docname+'.xml';
                       //if IsNull(  //xmlWriter) then
                      //xmlWriter :=   //xmlWriter.XmlTextWriter(XmlFileName, EncodingText.UTF8);
                      //xmlWriter.WriteStartDocument();
                    //Create Parent element
                      //xmlWriter.WriteStartElement('Columns');
                      //xmlWriter.WriteStartElement('Params');
                      //xmlWriter.WriteElementString('Library',CashManagementSetup."SharePoint Site Main Library");
                      //xmlWriter.WriteElementString('Folder',CashManagementSetup."SharePoint Document Library"+'/'+CashManagementSetup."Imprest Memo DMS Link"+'/'+Docname);
                      //xmlWriter.WriteEndElement();
                      //xmlWriter.WriteStartElement('Files');
                      //xmlWriter.WriteElementString('Filename',FileDesc);
                      //xmlWriter.WriteEndElement();
                     //Region Metadata
                      //xmlWriter.WriteStartElement('Column');
                    // REPEAT
                    //Create Child elements
                      //xmlWriter.WriteElementString('Title','Region');
                      //xmlWriter.WriteElementString('Value','');
                    //   //xmlWriter.WriteEndElement();
                    // UNTIL DocLines.NEXT = 0;
                    //End writing top element and XML document
                      //xmlWriter.WriteEndElement();
                   //Constituency Metadata
                      //xmlWriter.WriteStartElement('Column');
                      //xmlWriter.WriteElementString('Title','Constituency');
                      //xmlWriter.WriteElementString('Value','');
                      //xmlWriter.WriteEndElement();
                    //Employee Metadata
                      //xmlWriter.WriteStartElement('Column');
                      //xmlWriter.WriteElementString('Title','Employee');
                      //xmlWriter.WriteElementString('Value',UserId);
                      //xmlWriter.WriteEndElement();
                      //xmlWriter.WriteEndDocument();
                      //xmlWriter.Close();
                    end;
                   //  // Filer.CopyClientFile(FileName,'X:\'+Docname+'.xml',TRUE);
                      //Filer.MoveFile(FileName,'\\192.168.0.86\DocumentsPath\'+Docname+'.xml');
                    end;
                  Message('Documents Uploaded Successffully');

    end;

    procedure FnUploadImptestSurrenderDocs(DocNo: Code[50];DocDesc: Text;TabID: RecordID): Boolean
    var
        DocType: Record "DMS Documents";
        DocLines: Record CBRECEIPTS;
        FileName: Text[250];
          //xmlWriter: dotnet XmlTextWriter;
          //EncodingText: dotnet Encoding;
    begin
              CashManagementSetup.Get;
              if CashManagementSetup.Find('-') then begin
                //Uploade File to folder
                 Docname:=DocNo;
                 Docname:=ConvertStr(Docname,':','_');
                 Docname:=ConvertStr(Docname,':','_');
                   //FileName:=Filer.OpenFileDialog('Select Document To Upload','Select Document To Upload','PDF Files (*.PDF)|*.PDF|All files (*.*)|*.*');
                   //FileName2:='\\192.168.0.95\DocumentsPath\'+Docname+'_'+Filer.GetFileName(FileName);
                  //FileDesc:=Docname+'_'+Filer.GetFileName(FileName);
                 // Filer.CopyClientFile(FileName,FileName2,true);
                  //Filer.MoveFile(FileName2,'\\192.168.0.86\DocumentsPath\'+FileDesc);
               // CopyClientFile(FileName,'X:\'+FileName2,TRUE);
                //Insert Link
                DocLink.Init;
                DocLink."Link ID":=0;
                DocLink.URL1:=CashManagementSetup."SharePoint Site Link"+'/'+CashManagementSetup."SharePoint Site Main Library"+'/'+CashManagementSetup."SharePoint Document Library"+'/'+CashManagementSetup."Imprest Surrender DMS Link"+'/'+
                Docname+'/'+FileDesc;
                DocLink.Description:=FileDesc;
                DocLink.Type:=DocLink.Type::Link;
                DocLink.Company:=COMPANYNAME;
                DocLink."User ID":=UserId;
                DocLink.Created:=CreateDatetime(Today,Time);
                DocLink."Record ID":=TabID;
                DocLink.Insert;

                //Create Xml Document
                  CashManagementSetup.Get;
                  if CashManagementSetup.Find('-') then begin
                    XmlFileName:='\\192.168.0.86\DocumentsPath\'+Docname+'.xml';
                    FileName :='\\192.168.0.86\DocumentsPath\'+Docname+'.xml';
                    //FileName :=Docname+'.xml';
                       //if IsNull(  //xmlWriter) then
                      //xmlWriter :=   //xmlWriter.XmlTextWriter(XmlFileName, EncodingText.UTF8);
                      //xmlWriter.WriteStartDocument();
                    //Create Parent element
                      //xmlWriter.WriteStartElement('Columns');
                      //xmlWriter.WriteStartElement('Params');
                      //xmlWriter.WriteElementString('Library',CashManagementSetup."SharePoint Site Main Library");
                      //xmlWriter.WriteElementString('Folder',CashManagementSetup."SharePoint Document Library"+'/'+CashManagementSetup."Imprest Surrender DMS Link"+'/'+Docname);
                      //xmlWriter.WriteEndElement();
                      //xmlWriter.WriteStartElement('Files');
                      //xmlWriter.WriteElementString('Filename',FileDesc);
                      //xmlWriter.WriteEndElement();
                     //Region Metadata
                      //xmlWriter.WriteStartElement('Column');
                    // REPEAT
                    //Create Child elements
                      //xmlWriter.WriteElementString('Title','Region');
                      //xmlWriter.WriteElementString('Value','');
                    //   //xmlWriter.WriteEndElement();
                    // UNTIL DocLines.NEXT = 0;
                    //End writing top element and XML document
                      //xmlWriter.WriteEndElement();
                   //Constituency Metadata
                      //xmlWriter.WriteStartElement('Column');
                      //xmlWriter.WriteElementString('Title','Constituency');
                      //xmlWriter.WriteElementString('Value','');
                      //xmlWriter.WriteEndElement();
                    //Employee Metadata
                      //xmlWriter.WriteStartElement('Column');
                      //xmlWriter.WriteElementString('Title','Employee');
                      //xmlWriter.WriteElementString('Value',UserId);
                      //xmlWriter.WriteEndElement();
                      //xmlWriter.WriteEndDocument();
                      //xmlWriter.Close();
                    end;
                   //  // Filer.CopyClientFile(FileName,'X:\'+Docname+'.xml',TRUE);
                      //Filer.MoveFile(FileName,'\\192.168.0.86\DocumentsPath\'+Docname+'.xml');
                    end;
                  Message('Documents Uploaded Successffully');

    end;

    procedure FnUploadImptestRequisitionDocs(DocNo: Code[50];DocDesc: Text;TabID: RecordID): Boolean
    var
        DocType: Record "DMS Documents";
        DocLines: Record CBRECEIPTS;
        FileName: Text[250];
          //xmlWriter: dotnet XmlTextWriter;
          //EncodingText: dotnet Encoding;
    begin
              CashManagementSetup.Get;
              if CashManagementSetup.Find('-') then begin
                //Uploade File to folder
                 Docname:=DocNo;
                 Docname:=ConvertStr(Docname,':','_');
                 Docname:=ConvertStr(Docname,':','_');
                   //FileName:=Filer.OpenFileDialog('Select Document To Upload','Select Document To Upload','PDF Files (*.PDF)|*.PDF|All files (*.*)|*.*');
                   //FileName2:='\\192.168.0.95\DocumentsPath\'+Docname+'_'+Filer.GetFileName(FileName);
                  //FileDesc:=Docname+'_'+Filer.GetFileName(FileName);
                 // Filer.CopyClientFile(FileName,FileName2,true);
                  //Filer.MoveFile(FileName2,'\\192.168.0.86\DocumentsPath\'+FileDesc);
               // CopyClientFile(FileName,'X:\'+FileName2,TRUE);
                //Insert Link
                DocLink.Init;
                DocLink."Link ID":=0;
                DocLink.URL1:=CashManagementSetup."SharePoint Site Link"+'/'+CashManagementSetup."SharePoint Site Main Library"+'/'+CashManagementSetup."SharePoint Document Library"+'/'+CashManagementSetup."Payment Voucher DMS Link"+'/'+
                Docname+'/'+FileDesc;
                DocLink.Description:=FileDesc;
                DocLink.Type:=DocLink.Type::Link;
                DocLink.Company:=COMPANYNAME;
                DocLink."User ID":=UserId;
                DocLink.Created:=CreateDatetime(Today,Time);
                DocLink."Record ID":=TabID;
                DocLink.Insert;

                //Create Xml Document
                  CashManagementSetup.Get;
                  if CashManagementSetup.Find('-') then begin
                    XmlFileName:='\\192.168.0.86\DocumentsPath\'+Docname+'.xml';
                    FileName :='\\192.168.0.86\DocumentsPath\'+Docname+'.xml';
                    //FileName :=Docname+'.xml';
                       //if IsNull(  //xmlWriter) then
                      //xmlWriter :=   //xmlWriter.XmlTextWriter(XmlFileName, EncodingText.UTF8);
                      //xmlWriter.WriteStartDocument();
                    //Create Parent element
                      //xmlWriter.WriteStartElement('Columns');
                      //xmlWriter.WriteStartElement('Params');
                      //xmlWriter.WriteElementString('Library',CashManagementSetup."SharePoint Site Main Library");
                      //xmlWriter.WriteElementString('Folder',CashManagementSetup."SharePoint Document Library"+'/'+CashManagementSetup."Payment Voucher DMS Link"+'/'+Docname);
                      //xmlWriter.WriteEndElement();
                      //xmlWriter.WriteStartElement('Files');
                      //xmlWriter.WriteElementString('Filename',FileDesc);
                      //xmlWriter.WriteEndElement();
                     //Region Metadata
                      //xmlWriter.WriteStartElement('Column');
                    // REPEAT
                    //Create Child elements
                      //xmlWriter.WriteElementString('Title','Region');
                      //xmlWriter.WriteElementString('Value','');
                    //   //xmlWriter.WriteEndElement();
                    // UNTIL DocLines.NEXT = 0;
                    //End writing top element and XML document
                      //xmlWriter.WriteEndElement();
                   //Constituency Metadata
                      //xmlWriter.WriteStartElement('Column');
                      //xmlWriter.WriteElementString('Title','Constituency');
                      //xmlWriter.WriteElementString('Value','');
                      //xmlWriter.WriteEndElement();
                    //Employee Metadata
                      //xmlWriter.WriteStartElement('Column');
                      //xmlWriter.WriteElementString('Title','Employee');
                      //xmlWriter.WriteElementString('Value',UserId);
                      //xmlWriter.WriteEndElement();
                      //xmlWriter.WriteEndDocument();
                      //xmlWriter.Close();
                    end;
                   //  // Filer.CopyClientFile(FileName,'X:\'+Docname+'.xml',TRUE);
                      //Filer.MoveFile(FileName,'\\192.168.0.86\DocumentsPath\'+Docname+'.xml');
                    end;
                  Message('Documents Uploaded Successffully');

    end;

    procedure FnUploadPettycashvoucherDocs(DocNo: Code[50];DocDesc: Text;TabID: RecordID): Boolean
    var
        DocType: Record "DMS Documents";
        DocLines: Record CBRECEIPTS;
        FileName: Text[250];
          //xmlWriter: dotnet XmlTextWriter;
          //EncodingText: dotnet Encoding;
    begin
              CashManagementSetup.Get;
              if CashManagementSetup.Find('-') then begin
                //Uploade File to folder
                 Docname:=DocNo;
                 Docname:=ConvertStr(Docname,':','_');
                 Docname:=ConvertStr(Docname,':','_');
                   //FileName:=Filer.OpenFileDialog('Select Document To Upload','Select Document To Upload','PDF Files (*.PDF)|*.PDF|All files (*.*)|*.*');
                   //FileName2:='\\192.168.0.95\DocumentsPath\'+Docname+'_'+Filer.GetFileName(FileName);
                  //FileDesc:=Docname+'_'+Filer.GetFileName(FileName);
                 // Filer.CopyClientFile(FileName,FileName2,true);
                  //Filer.MoveFile(FileName2,'\\192.168.0.86\DocumentsPath\'+FileDesc);
               // CopyClientFile(FileName,'X:\'+FileName2,TRUE);
                //Insert Link
                DocLink.Init;
                DocLink."Link ID":=0;
                DocLink.URL1:=CashManagementSetup."SharePoint Site Link"+'/'+CashManagementSetup."SharePoint Site Main Library"+'/'+CashManagementSetup."SharePoint Document Library"+'/'+CashManagementSetup."Petty Cash Voucher DMS Link"+'/'+
                Docname+'/'+FileDesc;
                DocLink.Description:=FileDesc;
                DocLink.Type:=DocLink.Type::Link;
                DocLink.Company:=COMPANYNAME;
                DocLink."User ID":=UserId;
                DocLink.Created:=CreateDatetime(Today,Time);
                DocLink."Record ID":=TabID;
                DocLink.Insert;

                //Create Xml Document
                  CashManagementSetup.Get;
                  if CashManagementSetup.Find('-') then begin
                    XmlFileName:='\\192.168.0.86\DocumentsPath\'+Docname+'.xml';
                    FileName :='\\192.168.0.86\DocumentsPath\'+Docname+'.xml';
                    //FileName :=Docname+'.xml';
                       //if IsNull(  //xmlWriter) then
                      //xmlWriter :=   //xmlWriter.XmlTextWriter(XmlFileName, EncodingText.UTF8);
                      //xmlWriter.WriteStartDocument();
                    //Create Parent element
                      //xmlWriter.WriteStartElement('Columns');
                      //xmlWriter.WriteStartElement('Params');
                      //xmlWriter.WriteElementString('Library',CashManagementSetup."SharePoint Site Main Library");
                      //xmlWriter.WriteElementString('Folder',CashManagementSetup."SharePoint Document Library"+'/'+CashManagementSetup."Petty Cash Voucher DMS Link"+'/'+Docname);
                      //xmlWriter.WriteEndElement();
                      //xmlWriter.WriteStartElement('Files');
                      //xmlWriter.WriteElementString('Filename',FileDesc);
                      //xmlWriter.WriteEndElement();
                     //Region Metadata
                      //xmlWriter.WriteStartElement('Column');
                    // REPEAT
                    //Create Child elements
                      //xmlWriter.WriteElementString('Title','Region');
                      //xmlWriter.WriteElementString('Value','');
                    //   //xmlWriter.WriteEndElement();
                    // UNTIL DocLines.NEXT = 0;
                    //End writing top element and XML document
                      //xmlWriter.WriteEndElement();
                   //Constituency Metadata
                      //xmlWriter.WriteStartElement('Column');
                      //xmlWriter.WriteElementString('Title','Constituency');
                      //xmlWriter.WriteElementString('Value','');
                      //xmlWriter.WriteEndElement();
                    //Employee Metadata
                      //xmlWriter.WriteStartElement('Column');
                      //xmlWriter.WriteElementString('Title','Employee');
                      //xmlWriter.WriteElementString('Value',UserId);
                      //xmlWriter.WriteEndElement();
                      //xmlWriter.WriteEndDocument();
                      //xmlWriter.Close();
                    end;
                   //  // Filer.CopyClientFile(FileName,'X:\'+Docname+'.xml',TRUE);
                      //Filer.MoveFile(FileName,'\\192.168.0.86\DocumentsPath\'+Docname+'.xml');
                    end;
                  Message('Documents Uploaded Successffully');

    end;

    procedure FnUploadInterBankTransferDocs(DocNo: Code[50];DocDesc: Text;TabID: RecordID): Boolean
    var
        DocType: Record "DMS Documents";
        DocLines: Record CBRECEIPTS;
        FileName: Text[250];
          //xmlWriter: dotnet XmlTextWriter;
          //EncodingText: dotnet Encoding;
    begin
              CashManagementSetup.Get;
              if CashManagementSetup.Find('-') then begin
                //Uploade File to folder
                 Docname:=DocNo;
                 Docname:=ConvertStr(Docname,':','_');
                 Docname:=ConvertStr(Docname,':','_');
                   //FileName:=Filer.OpenFileDialog('Select Document To Upload','Select Document To Upload','PDF Files (*.PDF)|*.PDF|All files (*.*)|*.*');
                   //FileName2:='\\192.168.0.95\DocumentsPath\'+Docname+'_'+Filer.GetFileName(FileName);
                  //FileDesc:=Docname+'_'+Filer.GetFileName(FileName);
                 // Filer.CopyClientFile(FileName,FileName2,true);
                  //Filer.MoveFile(FileName2,'\\192.168.0.86\DocumentsPath\'+FileDesc);
               // CopyClientFile(FileName,'X:\'+FileName2,TRUE);
                //Insert Link
                DocLink.Init;
                DocLink."Link ID":=0;
                DocLink.URL1:=CashManagementSetup."SharePoint Site Link"+'/'+CashManagementSetup."SharePoint Site Main Library"+'/'+CashManagementSetup."SharePoint Document Library"+'/'+CashManagementSetup."Inter Bank Transfer DMS Link"+'/'+
                Docname+'/'+FileDesc;
                DocLink.Description:=FileDesc;
                DocLink.Type:=DocLink.Type::Link;
                DocLink.Company:=COMPANYNAME;
                DocLink."User ID":=UserId;
                DocLink.Created:=CreateDatetime(Today,Time);
                DocLink."Record ID":=TabID;
                DocLink.Insert;

                //Create Xml Document
                  CashManagementSetup.Get;
                  if CashManagementSetup.Find('-') then begin
                    XmlFileName:='\\192.168.0.86\DocumentsPath\'+Docname+'.xml';
                    FileName :='\\192.168.0.86\DocumentsPath\'+Docname+'.xml';
                    //FileName :=Docname+'.xml';
                       //if IsNull(  //xmlWriter) then
                      //xmlWriter :=   //xmlWriter.XmlTextWriter(XmlFileName, EncodingText.UTF8);
                      //xmlWriter.WriteStartDocument();
                    //Create Parent element
                      //xmlWriter.WriteStartElement('Columns');
                      //xmlWriter.WriteStartElement('Params');
                      //xmlWriter.WriteElementString('Library',CashManagementSetup."SharePoint Site Main Library");
                      //xmlWriter.WriteElementString('Folder',CashManagementSetup."SharePoint Document Library"+'/'+CashManagementSetup."Inter Bank Transfer DMS Link"+'/'+Docname);
                      //xmlWriter.WriteEndElement();
                      //xmlWriter.WriteStartElement('Files');
                      //xmlWriter.WriteElementString('Filename',FileDesc);
                      //xmlWriter.WriteEndElement();
                     //Region Metadata
                      //xmlWriter.WriteStartElement('Column');
                    // REPEAT
                    //Create Child elements
                      //xmlWriter.WriteElementString('Title','Region');
                      //xmlWriter.WriteElementString('Value','');
                    //   //xmlWriter.WriteEndElement();
                    // UNTIL DocLines.NEXT = 0;
                    //End writing top element and XML document
                      //xmlWriter.WriteEndElement();
                   //Constituency Metadata
                      //xmlWriter.WriteStartElement('Column');
                      //xmlWriter.WriteElementString('Title','Constituency');
                      //xmlWriter.WriteElementString('Value','');
                      //xmlWriter.WriteEndElement();
                    //Employee Metadata
                      //xmlWriter.WriteStartElement('Column');
                      //xmlWriter.WriteElementString('Title','Employee');
                      //xmlWriter.WriteElementString('Value',UserId);
                      //xmlWriter.WriteEndElement();
                      //xmlWriter.WriteEndDocument();
                      //xmlWriter.Close();
                    end;
                   //  // Filer.CopyClientFile(FileName,'X:\'+Docname+'.xml',TRUE);
                      //Filer.MoveFile(FileName,'\\192.168.0.86\DocumentsPath\'+Docname+'.xml');
                    end;
                  Message('Documents Uploaded Successffully');

    end;

    procedure FnUploadReceiptsDocs(DocNo: Code[50];DocDesc: Text;TabID: RecordID): Boolean
    var
        DocType: Record "DMS Documents";
        DocLines: Record CBRECEIPTS;
        FileName: Text[250];
          //xmlWriter: dotnet XmlTextWriter;
          //EncodingText: dotnet Encoding;
    begin
              CashManagementSetup.Get;
              if CashManagementSetup.Find('-') then begin
                //Uploade File to folder
                 Docname:=DocNo;
                 Docname:=ConvertStr(Docname,':','_');
                 Docname:=ConvertStr(Docname,':','_');
                   //FileName:=Filer.OpenFileDialog('Select Document To Upload','Select Document To Upload','PDF Files (*.PDF)|*.PDF|All files (*.*)|*.*');
                   //FileName2:='\\192.168.0.95\DocumentsPath\'+Docname+'_'+Filer.GetFileName(FileName);
                  //FileDesc:=Docname+'_'+Filer.GetFileName(FileName);
                 // Filer.CopyClientFile(FileName,FileName2,true);
                  //Filer.MoveFile(FileName2,'\\192.168.0.86\DocumentsPath\'+FileDesc);
               // CopyClientFile(FileName,'X:\'+FileName2,TRUE);
                //Insert Link
                DocLink.Init;
                DocLink."Link ID":=0;
                DocLink.URL1:=CashManagementSetup."SharePoint Site Link"+'/'+CashManagementSetup."SharePoint Site Main Library"+'/'+CashManagementSetup."SharePoint Document Library"+'/'+CashManagementSetup."Receipts DMS Link"+'/'+
                Docname+'/'+FileDesc;
                DocLink.Description:=FileDesc;
                DocLink.Type:=DocLink.Type::Link;
                DocLink.Company:=COMPANYNAME;
                DocLink."User ID":=UserId;
                DocLink.Created:=CreateDatetime(Today,Time);
                DocLink."Record ID":=TabID;
                DocLink.Insert;

                //Create Xml Document
                  CashManagementSetup.Get;
                  if CashManagementSetup.Find('-') then begin
                    XmlFileName:='\\192.168.0.86\DocumentsPath\'+Docname+'.xml';
                    FileName :='\\192.168.0.86\DocumentsPath\'+Docname+'.xml';
                    //FileName :=Docname+'.xml';
                       //if IsNull(  //xmlWriter) then
                      //xmlWriter :=   //xmlWriter.XmlTextWriter(XmlFileName, EncodingText.UTF8);
                      //xmlWriter.WriteStartDocument();
                    //Create Parent element
                      //xmlWriter.WriteStartElement('Columns');
                      //xmlWriter.WriteStartElement('Params');
                      //xmlWriter.WriteElementString('Library',CashManagementSetup."SharePoint Site Main Library");
                      //xmlWriter.WriteElementString('Folder',CashManagementSetup."SharePoint Document Library"+'/'+CashManagementSetup."Receipts DMS Link"+'/'+Docname);
                      //xmlWriter.WriteEndElement();
                      //xmlWriter.WriteStartElement('Files');
                      //xmlWriter.WriteElementString('Filename',FileDesc);
                      //xmlWriter.WriteEndElement();
                     //Region Metadata
                      //xmlWriter.WriteStartElement('Column');
                    // REPEAT
                    //Create Child elements
                      //xmlWriter.WriteElementString('Title','Region');
                      //xmlWriter.WriteElementString('Value','');
                    //   //xmlWriter.WriteEndElement();
                    // UNTIL DocLines.NEXT = 0;
                    //End writing top element and XML document
                      //xmlWriter.WriteEndElement();
                   //Constituency Metadata
                      //xmlWriter.WriteStartElement('Column');
                      //xmlWriter.WriteElementString('Title','Constituency');
                      //xmlWriter.WriteElementString('Value','');
                      //xmlWriter.WriteEndElement();
                    //Employee Metadata
                      //xmlWriter.WriteStartElement('Column');
                      //xmlWriter.WriteElementString('Title','Employee');
                      //xmlWriter.WriteElementString('Value',UserId);
                      //xmlWriter.WriteEndElement();
                      //xmlWriter.WriteEndDocument();
                      //xmlWriter.Close();
                    end;
                   //  // Filer.CopyClientFile(FileName,'X:\'+Docname+'.xml',TRUE);
                      //Filer.MoveFile(FileName,'\\192.168.0.86\DocumentsPath\'+Docname+'.xml');
                    end;
                  Message('Documents Uploaded Successffully');

    end;

    procedure FnUploadInterFundTransferDocs(DocNo: Code[50];DocDesc: Text;TabID: RecordID): Boolean
    var
        DocType: Record "DMS Documents";
        DocLines: Record CBRECEIPTS;
        FileName: Text[250];
          //xmlWriter: dotnet XmlTextWriter;
          //EncodingText: dotnet Encoding;
    begin
              CashManagementSetup.Get;
              if CashManagementSetup.Find('-') then begin
                //Uploade File to folder
                 Docname:=DocNo;
                 Docname:=ConvertStr(Docname,':','_');
                 Docname:=ConvertStr(Docname,':','_');
                   //FileName:=Filer.OpenFileDialog('Select Document To Upload','Select Document To Upload','PDF Files (*.PDF)|*.PDF|All files (*.*)|*.*');
                   //FileName2:='\\192.168.0.95\DocumentsPath\'+Docname+'_'+Filer.GetFileName(FileName);
                  //FileDesc:=Docname+'_'+Filer.GetFileName(FileName);
                 // Filer.CopyClientFile(FileName,FileName2,true);
                  //Filer.MoveFile(FileName2,'\\192.168.0.86\DocumentsPath\'+FileDesc);
               // CopyClientFile(FileName,'X:\'+FileName2,TRUE);
                //Insert Link
                DocLink.Init;
                DocLink."Link ID":=0;
                DocLink.URL1:=CashManagementSetup."SharePoint Site Link"+'/'+CashManagementSetup."SharePoint Site Main Library"+'/'+CashManagementSetup."SharePoint Document Library"+'/'+CashManagementSetup."Payment Voucher DMS Link"+'/'+
                Docname+'/'+FileDesc;
                DocLink.Description:=FileDesc;
                DocLink.Type:=DocLink.Type::Link;
                DocLink.Company:=COMPANYNAME;
                DocLink."User ID":=UserId;
                DocLink.Created:=CreateDatetime(Today,Time);
                DocLink."Record ID":=TabID;
                DocLink.Insert;

                //Create Xml Document
                  CashManagementSetup.Get;
                  if CashManagementSetup.Find('-') then begin
                    XmlFileName:='\\192.168.0.86\DocumentsPath\'+Docname+'.xml';
                    FileName :='\\192.168.0.86\DocumentsPath\'+Docname+'.xml';
                    //FileName :=Docname+'.xml';
                       //if IsNull(  //xmlWriter) then
                      //xmlWriter :=   //xmlWriter.XmlTextWriter(XmlFileName, EncodingText.UTF8);
                      //xmlWriter.WriteStartDocument();
                    //Create Parent element
                      //xmlWriter.WriteStartElement('Columns');
                      //xmlWriter.WriteStartElement('Params');
                      //xmlWriter.WriteElementString('Library',CashManagementSetup."SharePoint Site Main Library");
                      //xmlWriter.WriteElementString('Folder',CashManagementSetup."SharePoint Document Library"+'/'+CashManagementSetup."Payment Voucher DMS Link"+'/'+Docname);
                      //xmlWriter.WriteEndElement();
                      //xmlWriter.WriteStartElement('Files');
                      //xmlWriter.WriteElementString('Filename',FileDesc);
                      //xmlWriter.WriteEndElement();
                     //Region Metadata
                      //xmlWriter.WriteStartElement('Column');
                    // REPEAT
                    //Create Child elements
                      //xmlWriter.WriteElementString('Title','Region');
                      //xmlWriter.WriteElementString('Value','');
                    //   //xmlWriter.WriteEndElement();
                    // UNTIL DocLines.NEXT = 0;
                    //End writing top element and XML document
                      //xmlWriter.WriteEndElement();
                   //Constituency Metadata
                      //xmlWriter.WriteStartElement('Column');
                      //xmlWriter.WriteElementString('Title','Constituency');
                      //xmlWriter.WriteElementString('Value','');
                      //xmlWriter.WriteEndElement();
                    //Employee Metadata
                      //xmlWriter.WriteStartElement('Column');
                      //xmlWriter.WriteElementString('Title','Employee');
                      //xmlWriter.WriteElementString('Value',UserId);
                      //xmlWriter.WriteEndElement();
                      //xmlWriter.WriteEndDocument();
                      //xmlWriter.Close();
                    end;
                   //  // Filer.CopyClientFile(FileName,'X:\'+Docname+'.xml',TRUE);
                      //Filer.MoveFile(FileName,'\\192.168.0.86\DocumentsPath\'+Docname+'.xml');
                    end;
                  Message('Documents Uploaded Successffully');

    end;

    procedure FnUploadDirectIncomeVoucherDocs(DocNo: Code[50];DocDesc: Text;TabID: RecordID): Boolean
    var
        DocType: Record "DMS Documents";
        DocLines: Record CBRECEIPTS;
        FileName: Text[250];
          //xmlWriter: dotnet XmlTextWriter;
          //EncodingText: dotnet Encoding;
    begin
              CashManagementSetup.Get;
              if CashManagementSetup.Find('-') then begin
                //Uploade File to folder
                 Docname:=DocNo;
                 Docname:=ConvertStr(Docname,':','_');
                 Docname:=ConvertStr(Docname,':','_');
                   //FileName:=Filer.OpenFileDialog('Select Document To Upload','Select Document To Upload','PDF Files (*.PDF)|*.PDF|All files (*.*)|*.*');
                   //FileName2:='\\192.168.0.95\DocumentsPath\'+Docname+'_'+Filer.GetFileName(FileName);
                  //FileDesc:=Docname+'_'+Filer.GetFileName(FileName);
                 // Filer.CopyClientFile(FileName,FileName2,true);
                  //Filer.MoveFile(FileName2,'\\192.168.0.86\DocumentsPath\'+FileDesc);
               // CopyClientFile(FileName,'X:\'+FileName2,TRUE);
                //Insert Link
                DocLink.Init;
                DocLink."Link ID":=0;
                DocLink.URL1:=CashManagementSetup."SharePoint Site Link"+'/'+CashManagementSetup."SharePoint Site Main Library"+'/'+CashManagementSetup."SharePoint Document Library"+'/'+CashManagementSetup."Payment Voucher DMS Link"+'/'+
                Docname+'/'+FileDesc;
                DocLink.Description:=FileDesc;
                DocLink.Type:=DocLink.Type::Link;
                DocLink.Company:=COMPANYNAME;
                DocLink."User ID":=UserId;
                DocLink.Created:=CreateDatetime(Today,Time);
                DocLink."Record ID":=TabID;
                DocLink.Insert;

                //Create Xml Document
                  CashManagementSetup.Get;
                  if CashManagementSetup.Find('-') then begin
                    XmlFileName:='\\192.168.0.86\DocumentsPath\'+Docname+'.xml';
                    FileName :='\\192.168.0.86\DocumentsPath\'+Docname+'.xml';
                    //FileName :=Docname+'.xml';
                       //if IsNull(  //xmlWriter) then
                      //xmlWriter :=   //xmlWriter.XmlTextWriter(XmlFileName, EncodingText.UTF8);
                      //xmlWriter.WriteStartDocument();
                    //Create Parent element
                      //xmlWriter.WriteStartElement('Columns');
                      //xmlWriter.WriteStartElement('Params');
                      //xmlWriter.WriteElementString('Library',CashManagementSetup."SharePoint Site Main Library");
                      //xmlWriter.WriteElementString('Folder',CashManagementSetup."SharePoint Document Library"+'/'+CashManagementSetup."Payment Voucher DMS Link"+'/'+Docname);
                      //xmlWriter.WriteEndElement();
                      //xmlWriter.WriteStartElement('Files');
                      //xmlWriter.WriteElementString('Filename',FileDesc);
                      //xmlWriter.WriteEndElement();
                     //Region Metadata
                      //xmlWriter.WriteStartElement('Column');
                    // REPEAT
                    //Create Child elements
                      //xmlWriter.WriteElementString('Title','Region');
                      //xmlWriter.WriteElementString('Value','');
                    //   //xmlWriter.WriteEndElement();
                    // UNTIL DocLines.NEXT = 0;
                    //End writing top element and XML document
                      //xmlWriter.WriteEndElement();
                   //Constituency Metadata
                      //xmlWriter.WriteStartElement('Column');
                      //xmlWriter.WriteElementString('Title','Constituency');
                      //xmlWriter.WriteElementString('Value','');
                      //xmlWriter.WriteEndElement();
                    //Employee Metadata
                      //xmlWriter.WriteStartElement('Column');
                      //xmlWriter.WriteElementString('Title','Employee');
                      //xmlWriter.WriteElementString('Value',UserId);
                      //xmlWriter.WriteEndElement();
                      //xmlWriter.WriteEndDocument();
                      //xmlWriter.Close();
                    end;
                   //  // Filer.CopyClientFile(FileName,'X:\'+Docname+'.xml',TRUE);
                      //Filer.MoveFile(FileName,'\\192.168.0.86\DocumentsPath\'+Docname+'.xml');
                    end;
                  Message('Documents Uploaded Successffully');

    end;

    procedure FnUploadLeaveApplicationDocs(DocNo: Code[50];DocDesc: Text;TabID: RecordID): Boolean
    var
        DocType: Record "DMS Documents";
        DocLines: Record CBRECEIPTS;
        FileName: Text[250];
          //xmlWriter: dotnet XmlTextWriter;
          //EncodingText: dotnet Encoding;
    begin
              CashManagementSetup.Get;
              if CashManagementSetup.Find('-') then begin
                //Uploade File to folder
                 Docname:=DocNo;
                 Docname:=ConvertStr(Docname,':','_');
                 Docname:=ConvertStr(Docname,':','_');
                   //FileName:=Filer.OpenFileDialog('Select Document To Upload','Select Document To Upload','PDF Files (*.PDF)|*.PDF|All files (*.*)|*.*');
                   //FileName2:='\\192.168.0.95\DocumentsPath\'+Docname+'_'+Filer.GetFileName(FileName);
                  //FileDesc:=Docname+'_'+Filer.GetFileName(FileName);
                 // Filer.CopyClientFile(FileName,FileName2,true);
                  //Filer.MoveFile(FileName2,'\\192.168.0.86\DocumentsPath\'+FileDesc);
               // CopyClientFile(FileName,'X:\'+FileName2,TRUE);
                //Insert Link
                DocLink.Init;
                DocLink."Link ID":=0;
                DocLink.URL1:=CashManagementSetup."SharePoint Site Link"+'/'+CashManagementSetup."SharePoint Site Main Library"+'/'+CashManagementSetup."SharePoint Document Library"+'/'+CashManagementSetup."Leave Applications DMS Link"+'/'+
                Docname+'/'+FileDesc;
                DocLink.Description:=FileDesc;
                DocLink.Type:=DocLink.Type::Link;
                DocLink.Company:=COMPANYNAME;
                DocLink."User ID":=UserId;
                DocLink.Created:=CreateDatetime(Today,Time);
                DocLink."Record ID":=TabID;
                DocLink.Insert;

                //Create Xml Document
                  CashManagementSetup.Get;
                  if CashManagementSetup.Find('-') then begin
                    XmlFileName:='\\192.168.0.86\DocumentsPath\'+Docname+'.xml';
                    FileName :='\\192.168.0.86\DocumentsPath\'+Docname+'.xml';
                    //FileName :=Docname+'.xml';
                       //if IsNull(  //xmlWriter) then
                      //xmlWriter :=   //xmlWriter.XmlTextWriter(XmlFileName, EncodingText.UTF8);
                      //xmlWriter.WriteStartDocument();
                    //Create Parent element
                      //xmlWriter.WriteStartElement('Columns');
                      //xmlWriter.WriteStartElement('Params');
                      //xmlWriter.WriteElementString('Library',CashManagementSetup."SharePoint Site Main Library");
                      //xmlWriter.WriteElementString('Folder',CashManagementSetup."SharePoint Document Library"+'/'+CashManagementSetup."Leave Applications DMS Link"+'/'+Docname);
                      //xmlWriter.WriteEndElement();
                      //xmlWriter.WriteStartElement('Files');
                      //xmlWriter.WriteElementString('Filename',FileDesc);
                      //xmlWriter.WriteEndElement();
                     //Region Metadata
                      //xmlWriter.WriteStartElement('Column');
                    // REPEAT
                    //Create Child elements
                      //xmlWriter.WriteElementString('Title','Region');
                      //xmlWriter.WriteElementString('Value','');
                    //   //xmlWriter.WriteEndElement();
                    // UNTIL DocLines.NEXT = 0;
                    //End writing top element and XML document
                      //xmlWriter.WriteEndElement();
                   //Constituency Metadata
                      //xmlWriter.WriteStartElement('Column');
                      //xmlWriter.WriteElementString('Title','Constituency');
                      //xmlWriter.WriteElementString('Value','');
                      //xmlWriter.WriteEndElement();
                    //Employee Metadata
                      //xmlWriter.WriteStartElement('Column');
                      //xmlWriter.WriteElementString('Title','Employee');
                      //xmlWriter.WriteElementString('Value',UserId);
                      //xmlWriter.WriteEndElement();
                      //xmlWriter.WriteEndDocument();
                      //xmlWriter.Close();
                    end;
                   //  // Filer.CopyClientFile(FileName,'X:\'+Docname+'.xml',TRUE);
                      //Filer.MoveFile(FileName,'\\192.168.0.86\DocumentsPath\'+Docname+'.xml');
                    end;
                  Message('Documents Uploaded Successffully');

    end;

    procedure FnUploadStoreRequisitionDocs(DocNo: Code[50];DocDesc: Text;TabID: RecordID): Boolean
    var
        DocType: Record "DMS Documents";
        DocLines: Record CBRECEIPTS;
        FileName: Text[250];
          //xmlWriter: dotnet XmlTextWriter;
          //EncodingText: dotnet Encoding;
    begin
              CashManagementSetup.Get;
              if CashManagementSetup.Find('-') then begin
                //Uploade File to folder
                 Docname:=DocNo;
                 Docname:=ConvertStr(Docname,':','_');
                 Docname:=ConvertStr(Docname,':','_');
                   //FileName:=Filer.OpenFileDialog('Select Document To Upload','Select Document To Upload','PDF Files (*.PDF)|*.PDF|All files (*.*)|*.*');
                   //FileName2:='\\192.168.0.95\DocumentsPath\'+Docname+'_'+Filer.GetFileName(FileName);
                  //FileDesc:=Docname+'_'+Filer.GetFileName(FileName);
                 // Filer.CopyClientFile(FileName,FileName2,true);
                  //Filer.MoveFile(FileName2,'\\192.168.0.86\DocumentsPath\'+FileDesc);
               // CopyClientFile(FileName,'X:\'+FileName2,TRUE);
                //Insert Link
                DocLink.Init;
                DocLink."Link ID":=0;
                DocLink.URL1:=CashManagementSetup."SharePoint Site Link"+'/'+CashManagementSetup."SharePoint Site Main Library"+'/'+CashManagementSetup."SharePoint Document Library"+'/'+CashManagementSetup."Store Requisition Links"+'/'+
                Docname+'/'+FileDesc;
                DocLink.Description:=FileDesc;
                DocLink.Type:=DocLink.Type::Link;
                DocLink.Company:=COMPANYNAME;
                DocLink."User ID":=UserId;
                DocLink.Created:=CreateDatetime(Today,Time);
                DocLink."Record ID":=TabID;
                DocLink.Insert;

                //Create Xml Document
                  CashManagementSetup.Get;
                  if CashManagementSetup.Find('-') then begin
                    XmlFileName:='\\192.168.0.86\DocumentsPath\'+Docname+'.xml';
                    FileName :='\\192.168.0.86\DocumentsPath\'+Docname+'.xml';
                    //FileName :=Docname+'.xml';
                       //if IsNull(  //xmlWriter) then
                      //xmlWriter :=   //xmlWriter.XmlTextWriter(XmlFileName, EncodingText.UTF8);
                      //xmlWriter.WriteStartDocument();
                    //Create Parent element
                      //xmlWriter.WriteStartElement('Columns');
                      //xmlWriter.WriteStartElement('Params');
                      //xmlWriter.WriteElementString('Library',CashManagementSetup."SharePoint Site Main Library");
                      //xmlWriter.WriteElementString('Folder',CashManagementSetup."SharePoint Document Library"+'/'+CashManagementSetup."Store Requisition Links"+'/'+Docname);
                      //xmlWriter.WriteEndElement();
                      //xmlWriter.WriteStartElement('Files');
                      //xmlWriter.WriteElementString('Filename',FileDesc);
                      //xmlWriter.WriteEndElement();
                     //Region Metadata
                      //xmlWriter.WriteStartElement('Column');
                    // REPEAT
                    //Create Child elements
                      //xmlWriter.WriteElementString('Title','Region');
                      //xmlWriter.WriteElementString('Value','');
                    //   //xmlWriter.WriteEndElement();
                    // UNTIL DocLines.NEXT = 0;
                    //End writing top element and XML document
                      //xmlWriter.WriteEndElement();
                   //Constituency Metadata
                      //xmlWriter.WriteStartElement('Column');
                      //xmlWriter.WriteElementString('Title','Constituency');
                      //xmlWriter.WriteElementString('Value','');
                      //xmlWriter.WriteEndElement();
                    //Employee Metadata
                      //xmlWriter.WriteStartElement('Column');
                      //xmlWriter.WriteElementString('Title','Employee');
                      //xmlWriter.WriteElementString('Value',UserId);
                      //xmlWriter.WriteEndElement();
                      //xmlWriter.WriteEndDocument();
                      //xmlWriter.Close();
                    end;
                   //  // Filer.CopyClientFile(FileName,'X:\'+Docname+'.xml',TRUE);
                      //Filer.MoveFile(FileName,'\\192.168.0.86\DocumentsPath\'+Docname+'.xml');
                    end;
                  Message('Documents Uploaded Successffully');

    end;

    procedure FnUploadPurchaseRequisitionDocs(DocNo: Code[50];DocDesc: Text;TabID: RecordID): Boolean
    var
        DocType: Record "DMS Documents";
        DocLines: Record CBRECEIPTS;
        FileName: Text[250];
          //xmlWriter: dotnet XmlTextWriter;
          //EncodingText: dotnet Encoding;
    begin
              CashManagementSetup.Get;
              if CashManagementSetup.Find('-') then begin
                //Uploade File to folder
                 Docname:=DocNo;
                 Docname:=ConvertStr(Docname,':','_');
                 Docname:=ConvertStr(Docname,':','_');
                   //FileName:=Filer.OpenFileDialog('Select Document To Upload','Select Document To Upload','PDF Files (*.PDF)|*.PDF|All files (*.*)|*.*');
                   //FileName2:='\\192.168.0.95\DocumentsPath\'+Docname+'_'+Filer.GetFileName(FileName);
                  //FileDesc:=Docname+'_'+Filer.GetFileName(FileName);
                 // Filer.CopyClientFile(FileName,FileName2,true);
                  //Filer.MoveFile(FileName2,'\\192.168.0.86\DocumentsPath\'+FileDesc);
               // CopyClientFile(FileName,'X:\'+FileName2,TRUE);
                //Insert Link
                DocLink.Init;
                DocLink."Link ID":=0;
                DocLink.URL1:=CashManagementSetup."SharePoint Site Link"+'/'+CashManagementSetup."SharePoint Site Main Library"+'/'+CashManagementSetup."SharePoint Document Library"+'/'+CashManagementSetup."Purchase Requisition Link"+'/'+
                Docname+'/'+FileDesc;
                DocLink.Description:=FileDesc;
                DocLink.Type:=DocLink.Type::Link;
                DocLink.Company:=COMPANYNAME;
                DocLink."User ID":=UserId;
                DocLink.Created:=CreateDatetime(Today,Time);
                DocLink."Record ID":=TabID;
                DocLink.Insert;

                //Create Xml Document
                  CashManagementSetup.Get;
                  if CashManagementSetup.Find('-') then begin
                    XmlFileName:='\\192.168.0.86\DocumentsPath\'+Docname+'.xml';
                    FileName :='\\192.168.0.86\DocumentsPath\'+Docname+'.xml';
                    //FileName :=Docname+'.xml';
                       //if IsNull(  //xmlWriter) then
                      //xmlWriter :=   //xmlWriter.XmlTextWriter(XmlFileName, EncodingText.UTF8);
                      //xmlWriter.WriteStartDocument();
                    //Create Parent element
                      //xmlWriter.WriteStartElement('Columns');
                      //xmlWriter.WriteStartElement('Params');
                      //xmlWriter.WriteElementString('Library',CashManagementSetup."SharePoint Site Main Library");
                      //xmlWriter.WriteElementString('Folder',CashManagementSetup."SharePoint Document Library"+'/'+CashManagementSetup."Purchase Requisition Link"+'/'+Docname);
                      //xmlWriter.WriteEndElement();
                      //xmlWriter.WriteStartElement('Files');
                      //xmlWriter.WriteElementString('Filename',FileDesc);
                      //xmlWriter.WriteEndElement();
                     //Region Metadata
                      //xmlWriter.WriteStartElement('Column');
                    // REPEAT
                    //Create Child elements
                      //xmlWriter.WriteElementString('Title','Region');
                      //xmlWriter.WriteElementString('Value','');
                    //   //xmlWriter.WriteEndElement();
                    // UNTIL DocLines.NEXT = 0;
                    //End writing top element and XML document
                      //xmlWriter.WriteEndElement();
                   //Constituency Metadata
                      //xmlWriter.WriteStartElement('Column');
                      //xmlWriter.WriteElementString('Title','Constituency');
                      //xmlWriter.WriteElementString('Value','');
                      //xmlWriter.WriteEndElement();
                    //Employee Metadata
                      //xmlWriter.WriteStartElement('Column');
                      //xmlWriter.WriteElementString('Title','Employee');
                      //xmlWriter.WriteElementString('Value',UserId);
                      //xmlWriter.WriteEndElement();
                      //xmlWriter.WriteEndDocument();
                      //xmlWriter.Close();
                    end;
                   //  // Filer.CopyClientFile(FileName,'X:\'+Docname+'.xml',TRUE);
                      //Filer.MoveFile(FileName,'\\192.168.0.86\DocumentsPath\'+Docname+'.xml');
                    end;
                  Message('Documents Uploaded Successffully');

    end;

    procedure FnUploadSalaryVoucherDocs(DocNo: Code[50];DocDesc: Text;TabID: RecordID): Boolean
    var
        DocType: Record "DMS Documents";
        DocLines: Record CBRECEIPTS;
        FileName: Text[250];
          //xmlWriter: dotnet XmlTextWriter;
          //EncodingText: dotnet Encoding;
    begin
              CashManagementSetup.Get;
              if CashManagementSetup.Find('-') then begin
                //Uploade File to folder
                 Docname:=DocNo;
                 Docname:=ConvertStr(Docname,':','_');
                 Docname:=ConvertStr(Docname,':','_');
                   //FileName:=Filer.OpenFileDialog('Select Document To Upload','Select Document To Upload','PDF Files (*.PDF)|*.PDF|All files (*.*)|*.*');
                   //FileName2:='\\192.168.0.95\DocumentsPath\'+Docname+'_'+Filer.GetFileName(FileName);
                  //FileDesc:=Docname+'_'+Filer.GetFileName(FileName);
                 // Filer.CopyClientFile(FileName,FileName2,true);
                  //Filer.MoveFile(FileName2,'\\192.168.0.86\DocumentsPath\'+FileDesc);
               // CopyClientFile(FileName,'X:\'+FileName2,TRUE);
                //Insert Link
                DocLink.Init;
                DocLink."Link ID":=0;
                DocLink.URL1:=CashManagementSetup."SharePoint Site Link"+'/'+CashManagementSetup."SharePoint Site Main Library"+'/'+CashManagementSetup."SharePoint Document Library"+'/'+CashManagementSetup."Salary Voucher DMS Link"+'/'+
                Docname+'/'+FileDesc;
                DocLink.Description:=FileDesc;
                DocLink.Type:=DocLink.Type::Link;
                DocLink.Company:=COMPANYNAME;
                DocLink."User ID":=UserId;
                DocLink.Created:=CreateDatetime(Today,Time);
                DocLink."Record ID":=TabID;
                DocLink.Insert;

                //Create Xml Document
                  CashManagementSetup.Get;
                  if CashManagementSetup.Find('-') then begin
                    XmlFileName:='\\192.168.0.86\DocumentsPath\'+Docname+'.xml';
                    FileName :='\\192.168.0.86\DocumentsPath\'+Docname+'.xml';
                    //FileName :=Docname+'.xml';
                       //if IsNull(  //xmlWriter) then
                      //xmlWriter :=   //xmlWriter.XmlTextWriter(XmlFileName, EncodingText.UTF8);
                      //xmlWriter.WriteStartDocument();
                    //Create Parent element
                      //xmlWriter.WriteStartElement('Columns');
                      //xmlWriter.WriteStartElement('Params');
                      //xmlWriter.WriteElementString('Library',CashManagementSetup."SharePoint Site Main Library");
                      //xmlWriter.WriteElementString('Folder',CashManagementSetup."SharePoint Document Library"+'/'+CashManagementSetup."Salary Voucher DMS Link"+'/'+Docname);
                      //xmlWriter.WriteEndElement();
                      //xmlWriter.WriteStartElement('Files');
                      //xmlWriter.WriteElementString('Filename',FileDesc);
                      //xmlWriter.WriteEndElement();
                     //Region Metadata
                      //xmlWriter.WriteStartElement('Column');
                    // REPEAT
                    //Create Child elements
                      //xmlWriter.WriteElementString('Title','Region');
                      //xmlWriter.WriteElementString('Value','');
                    //   //xmlWriter.WriteEndElement();
                    // UNTIL DocLines.NEXT = 0;
                    //End writing top element and XML document
                      //xmlWriter.WriteEndElement();
                   //Constituency Metadata
                      //xmlWriter.WriteStartElement('Column');
                      //xmlWriter.WriteElementString('Title','Constituency');
                      //xmlWriter.WriteElementString('Value','');
                      //xmlWriter.WriteEndElement();
                    //Employee Metadata
                      //xmlWriter.WriteStartElement('Column');
                      //xmlWriter.WriteElementString('Title','Employee');
                      //xmlWriter.WriteElementString('Value',UserId);
                      //xmlWriter.WriteEndElement();
                      //xmlWriter.WriteEndDocument();
                      //xmlWriter.Close();
                    end;
                   //  // Filer.CopyClientFile(FileName,'X:\'+Docname+'.xml',TRUE);
                      //Filer.MoveFile(FileName,'\\192.168.0.86\DocumentsPath\'+Docname+'.xml');
                    end;
                  Message('Documents Uploaded Successffully');

    end;

    procedure FnUploadAIEDocs(DocNo: Code[50];DocDesc: Text;TabID: RecordID): Boolean
    var
        DocType: Record "DMS Documents";
        DocLines: Record CBRECEIPTS;
        FileName: Text[250];
          //xmlWriter: dotnet XmlTextWriter;
          //EncodingText: dotnet Encoding;
    begin
              CashManagementSetup.Get;
              if CashManagementSetup.Find('-') then begin
                //Uploade File to folder
                 Docname:=DocNo;
                 Docname:=ConvertStr(Docname,':','_');
                 Docname:=ConvertStr(Docname,':','_');
                   //FileName:=Filer.OpenFileDialog('Select Document To Upload','Select Document To Upload','PDF Files (*.PDF)|*.PDF|All files (*.*)|*.*');
                   //FileName2:='\\192.168.0.95\DocumentsPath\'+Docname+'_'+Filer.GetFileName(FileName);
                  //FileDesc:=Docname+'_'+Filer.GetFileName(FileName);
                 // Filer.CopyClientFile(FileName,FileName2,true);
                  //Filer.MoveFile(FileName2,'\\192.168.0.86\DocumentsPath\'+FileDesc);
               // CopyClientFile(FileName,'X:\'+FileName2,TRUE);
                //Insert Link
                DocLink.Init;
                DocLink."Link ID":=0;
                DocLink.URL1:=CashManagementSetup."SharePoint Site Link"+'/'+CashManagementSetup."SharePoint Site Main Library"+'/'+CashManagementSetup."SharePoint Document Library"+'/'+CashManagementSetup."Payment Voucher DMS Link"+'/'+
                Docname+'/'+FileDesc;
                DocLink.Description:=FileDesc;
                DocLink.Type:=DocLink.Type::Link;
                DocLink.Company:=COMPANYNAME;
                DocLink."User ID":=UserId;
                DocLink.Created:=CreateDatetime(Today,Time);
                DocLink."Record ID":=TabID;
                DocLink.Insert;

                //Create Xml Document
                  CashManagementSetup.Get;
                  if CashManagementSetup.Find('-') then begin
                    XmlFileName:='\\192.168.0.86\DocumentsPath\'+Docname+'.xml';
                    FileName :='\\192.168.0.86\DocumentsPath\'+Docname+'.xml';
                    //FileName :=Docname+'.xml';
                       //if IsNull(  //xmlWriter) then
                      //xmlWriter :=   //xmlWriter.XmlTextWriter(XmlFileName, EncodingText.UTF8);
                      //xmlWriter.WriteStartDocument();
                    //Create Parent element
                      //xmlWriter.WriteStartElement('Columns');
                      //xmlWriter.WriteStartElement('Params');
                      //xmlWriter.WriteElementString('Library',CashManagementSetup."SharePoint Site Main Library");
                      //xmlWriter.WriteElementString('Folder',CashManagementSetup."SharePoint Document Library"+'/'+CashManagementSetup."Payment Voucher DMS Link"+'/'+Docname);
                      //xmlWriter.WriteEndElement();
                      //xmlWriter.WriteStartElement('Files');
                      //xmlWriter.WriteElementString('Filename',FileDesc);
                      //xmlWriter.WriteEndElement();
                     //Region Metadata
                      //xmlWriter.WriteStartElement('Column');
                    // REPEAT
                    //Create Child elements
                      //xmlWriter.WriteElementString('Title','Region');
                      //xmlWriter.WriteElementString('Value','');
                    //   //xmlWriter.WriteEndElement();
                    // UNTIL DocLines.NEXT = 0;
                    //End writing top element and XML document
                      //xmlWriter.WriteEndElement();
                   //Constituency Metadata
                      //xmlWriter.WriteStartElement('Column');
                      //xmlWriter.WriteElementString('Title','Constituency');
                      //xmlWriter.WriteElementString('Value','');
                      //xmlWriter.WriteEndElement();
                    //Employee Metadata
                      //xmlWriter.WriteStartElement('Column');
                      //xmlWriter.WriteElementString('Title','Employee');
                      //xmlWriter.WriteElementString('Value',UserId);
                      //xmlWriter.WriteEndElement();
                      //xmlWriter.WriteEndDocument();
                      //xmlWriter.Close();
                    end;
                   //  // Filer.CopyClientFile(FileName,'X:\'+Docname+'.xml',TRUE);
                      //Filer.MoveFile(FileName,'\\192.168.0.86\DocumentsPath\'+Docname+'.xml');
                    end;
                  Message('Documents Uploaded Successffully');

    end;

    procedure FnUploadSalaryAdvanceDocs(DocNo: Code[50];DocDesc: Text;TabID: RecordID): Boolean
    var
        DocType: Record "DMS Documents";
        DocLines: Record CBRECEIPTS;
        FileName: Text[250];
          //xmlWriter: dotnet XmlTextWriter;
          //EncodingText: dotnet Encoding;
    begin
              CashManagementSetup.Get;
              if CashManagementSetup.Find('-') then begin
                //Uploade File to folder
                 Docname:=DocNo;
                 Docname:=ConvertStr(Docname,':','_');
                 Docname:=ConvertStr(Docname,':','_');
                   //FileName:=Filer.OpenFileDialog('Select Document To Upload','Select Document To Upload','PDF Files (*.PDF)|*.PDF|All files (*.*)|*.*');
                   //FileName2:='\\192.168.0.95\DocumentsPath\'+Docname+'_'+Filer.GetFileName(FileName);
                  //FileDesc:=Docname+'_'+Filer.GetFileName(FileName);
                 // Filer.CopyClientFile(FileName,FileName2,true);
                  //Filer.MoveFile(FileName2,'\\192.168.0.86\DocumentsPath\'+FileDesc);
               // CopyClientFile(FileName,'X:\'+FileName2,TRUE);
                //Insert Link
                DocLink.Init;
                DocLink."Link ID":=0;
                DocLink.URL1:=CashManagementSetup."SharePoint Site Link"+'/'+CashManagementSetup."SharePoint Site Main Library"+'/'+CashManagementSetup."SharePoint Document Library"+'/'+CashManagementSetup."Payment Voucher DMS Link"+'/'+
                Docname+'/'+FileDesc;
                DocLink.Description:=FileDesc;
                DocLink.Type:=DocLink.Type::Link;
                DocLink.Company:=COMPANYNAME;
                DocLink."User ID":=UserId;
                DocLink.Created:=CreateDatetime(Today,Time);
                DocLink."Record ID":=TabID;
                DocLink.Insert;

                //Create Xml Document
                  CashManagementSetup.Get;
                  if CashManagementSetup.Find('-') then begin
                    XmlFileName:='\\192.168.0.86\DocumentsPath\'+Docname+'.xml';
                    FileName :='\\192.168.0.86\DocumentsPath\'+Docname+'.xml';
                    //FileName :=Docname+'.xml';
                       //if IsNull(  //xmlWriter) then
                      //xmlWriter :=   //xmlWriter.XmlTextWriter(XmlFileName, EncodingText.UTF8);
                      //xmlWriter.WriteStartDocument();
                    //Create Parent element
                      //xmlWriter.WriteStartElement('Columns');
                      //xmlWriter.WriteStartElement('Params');
                      //xmlWriter.WriteElementString('Library',CashManagementSetup."SharePoint Site Main Library");
                      //xmlWriter.WriteElementString('Folder',CashManagementSetup."SharePoint Document Library"+'/'+CashManagementSetup."Payment Voucher DMS Link"+'/'+Docname);
                      //xmlWriter.WriteEndElement();
                      //xmlWriter.WriteStartElement('Files');
                      //xmlWriter.WriteElementString('Filename',FileDesc);
                      //xmlWriter.WriteEndElement();
                     //Region Metadata
                      //xmlWriter.WriteStartElement('Column');
                    // REPEAT
                    //Create Child elements
                      //xmlWriter.WriteElementString('Title','Region');
                      //xmlWriter.WriteElementString('Value','');
                    //   //xmlWriter.WriteEndElement();
                    // UNTIL DocLines.NEXT = 0;
                    //End writing top element and XML document
                      //xmlWriter.WriteEndElement();
                   //Constituency Metadata
                      //xmlWriter.WriteStartElement('Column');
                      //xmlWriter.WriteElementString('Title','Constituency');
                      //xmlWriter.WriteElementString('Value','');
                      //xmlWriter.WriteEndElement();
                    //Employee Metadata
                      //xmlWriter.WriteStartElement('Column');
                      //xmlWriter.WriteElementString('Title','Employee');
                      //xmlWriter.WriteElementString('Value',UserId);
                      //xmlWriter.WriteEndElement();
                      //xmlWriter.WriteEndDocument();
                      //xmlWriter.Close();
                    end;
                   //  // Filer.CopyClientFile(FileName,'X:\'+Docname+'.xml',TRUE);
                      //Filer.MoveFile(FileName,'\\192.168.0.86\DocumentsPath\'+Docname+'.xml');
                    end;
                  Message('Documents Uploaded Successffully');

    end;

    procedure FnUploadSpecialPCDocs(DocNo: Code[50];DocDesc: Text;TabID: RecordID): Boolean
    var
        DocType: Record "DMS Documents";
        DocLines: Record CBRECEIPTS;
        FileName: Text[250];
          //xmlWriter: dotnet XmlTextWriter;
          //EncodingText: dotnet Encoding;
    begin
              CashManagementSetup.Get;
              if CashManagementSetup.Find('-') then begin
                //Uploade File to folder
                 Docname:=DocNo;
                 Docname:=ConvertStr(Docname,':','_');
                 Docname:=ConvertStr(Docname,':','_');
                   //FileName:=Filer.OpenFileDialog('Select Document To Upload','Select Document To Upload','PDF Files (*.PDF)|*.PDF|All files (*.*)|*.*');
                   //FileName2:='\\192.168.0.95\DocumentsPath\'+Docname+'_'+Filer.GetFileName(FileName);
                  //FileDesc:=Docname+'_'+Filer.GetFileName(FileName);
                 // Filer.CopyClientFile(FileName,FileName2,true);
                  //Filer.MoveFile(FileName2,'\\192.168.0.86\DocumentsPath\'+FileDesc);
               // CopyClientFile(FileName,'X:\'+FileName2,TRUE);
                //Insert Link
                DocLink.Init;
                DocLink."Link ID":=0;
                DocLink.URL1:=CashManagementSetup."SharePoint Site Link"+'/'+CashManagementSetup."SharePoint Site Main Library"+'/'+CashManagementSetup."SharePoint Document Library"+'/'+CashManagementSetup."Payment Voucher DMS Link"+'/'+
                Docname+'/'+FileDesc;
                DocLink.Description:=FileDesc;
                DocLink.Type:=DocLink.Type::Link;
                DocLink.Company:=COMPANYNAME;
                DocLink."User ID":=UserId;
                DocLink.Created:=CreateDatetime(Today,Time);
                DocLink."Record ID":=TabID;
                DocLink.Insert;

                //Create Xml Document
                  CashManagementSetup.Get;
                  if CashManagementSetup.Find('-') then begin
                    XmlFileName:='\\192.168.0.86\DocumentsPath\'+Docname+'.xml';
                    FileName :='\\192.168.0.86\DocumentsPath\'+Docname+'.xml';
                    //FileName :=Docname+'.xml';
                       //if IsNull(  //xmlWriter) then
                      //xmlWriter :=   //xmlWriter.XmlTextWriter(XmlFileName, EncodingText.UTF8);
                      //xmlWriter.WriteStartDocument();
                    //Create Parent element
                      //xmlWriter.WriteStartElement('Columns');
                      //xmlWriter.WriteStartElement('Params');
                      //xmlWriter.WriteElementString('Library',CashManagementSetup."SharePoint Site Main Library");
                      //xmlWriter.WriteElementString('Folder',CashManagementSetup."SharePoint Document Library"+'/'+CashManagementSetup."Payment Voucher DMS Link"+'/'+Docname);
                      //xmlWriter.WriteEndElement();
                      //xmlWriter.WriteStartElement('Files');
                      //xmlWriter.WriteElementString('Filename',FileDesc);
                      //xmlWriter.WriteEndElement();
                     //Region Metadata
                      //xmlWriter.WriteStartElement('Column');
                    // REPEAT
                    //Create Child elements
                      //xmlWriter.WriteElementString('Title','Region');
                      //xmlWriter.WriteElementString('Value','');
                    //   //xmlWriter.WriteEndElement();
                    // UNTIL DocLines.NEXT = 0;
                    //End writing top element and XML document
                      //xmlWriter.WriteEndElement();
                   //Constituency Metadata
                      //xmlWriter.WriteStartElement('Column');
                      //xmlWriter.WriteElementString('Title','Constituency');
                      //xmlWriter.WriteElementString('Value','');
                      //xmlWriter.WriteEndElement();
                    //Employee Metadata
                      //xmlWriter.WriteStartElement('Column');
                      //xmlWriter.WriteElementString('Title','Employee');
                      //xmlWriter.WriteElementString('Value',UserId);
                      //xmlWriter.WriteEndElement();
                      //xmlWriter.WriteEndDocument();
                      //xmlWriter.Close();
                    end;
                   //  // Filer.CopyClientFile(FileName,'X:\'+Docname+'.xml',TRUE);
                      //Filer.MoveFile(FileName,'\\192.168.0.86\DocumentsPath\'+Docname+'.xml');
                    end;
                  Message('Documents Uploaded Successffully');

    end;

    procedure FnUploadWarrantVoucherDocs(DocNo: Code[50];DocDesc: Text;TabID: RecordID): Boolean
    var
        DocType: Record "DMS Documents";
        DocLines: Record CBRECEIPTS;
        FileName: Text[250];
          //xmlWriter: dotnet XmlTextWriter;
          //EncodingText: dotnet Encoding;
    begin
              CashManagementSetup.Get;
              if CashManagementSetup.Find('-') then begin
                //Uploade File to folder
                 Docname:=DocNo;
                 Docname:=ConvertStr(Docname,':','_');
                 Docname:=ConvertStr(Docname,':','_');
                   //FileName:=Filer.OpenFileDialog('Select Document To Upload','Select Document To Upload','PDF Files (*.PDF)|*.PDF|All files (*.*)|*.*');
                   //FileName2:='\\192.168.0.95\DocumentsPath\'+Docname+'_'+Filer.GetFileName(FileName);
                  //FileDesc:=Docname+'_'+Filer.GetFileName(FileName);
                 // Filer.CopyClientFile(FileName,FileName2,true);
                  //Filer.MoveFile(FileName2,'\\192.168.0.86\DocumentsPath\'+FileDesc);
               // CopyClientFile(FileName,'X:\'+FileName2,TRUE);
                //Insert Link
                DocLink.Init;
                DocLink."Link ID":=0;
                DocLink.URL1:=CashManagementSetup."SharePoint Site Link"+'/'+CashManagementSetup."SharePoint Site Main Library"+'/'+CashManagementSetup."SharePoint Document Library"+'/'+CashManagementSetup."Warrant Voucher Links"+'/'+
                Docname+'/'+FileDesc;
                DocLink.Description:=FileDesc;
                DocLink.Type:=DocLink.Type::Link;
                DocLink.Company:=COMPANYNAME;
                DocLink."User ID":=UserId;
                DocLink.Created:=CreateDatetime(Today,Time);
                DocLink."Record ID":=TabID;
                DocLink.Insert;

                //Create Xml Document
                  CashManagementSetup.Get;
                  if CashManagementSetup.Find('-') then begin
                    XmlFileName:='\\192.168.0.86\DocumentsPath\'+Docname+'.xml';
                    FileName :='\\192.168.0.86\DocumentsPath\'+Docname+'.xml';
                    //FileName :=Docname+'.xml';
                       //if IsNull(  //xmlWriter) then
                      //xmlWriter :=   //xmlWriter.XmlTextWriter(XmlFileName, EncodingText.UTF8);
                      //xmlWriter.WriteStartDocument();
                    //Create Parent element
                      //xmlWriter.WriteStartElement('Columns');
                      //xmlWriter.WriteStartElement('Params');
                      //xmlWriter.WriteElementString('Library',CashManagementSetup."SharePoint Site Main Library");
                      //xmlWriter.WriteElementString('Folder',CashManagementSetup."SharePoint Document Library"+'/'+CashManagementSetup."Warrant Voucher Links"+'/'+Docname);
                      //xmlWriter.WriteEndElement();
                      //xmlWriter.WriteStartElement('Files');
                      //xmlWriter.WriteElementString('Filename',FileDesc);
                      //xmlWriter.WriteEndElement();
                     //Region Metadata
                      //xmlWriter.WriteStartElement('Column');
                    // REPEAT
                    //Create Child elements
                      //xmlWriter.WriteElementString('Title','Region');
                      //xmlWriter.WriteElementString('Value','');
                    //   //xmlWriter.WriteEndElement();
                    // UNTIL DocLines.NEXT = 0;
                    //End writing top element and XML document
                      //xmlWriter.WriteEndElement();
                   //Constituency Metadata
                      //xmlWriter.WriteStartElement('Column');
                      //xmlWriter.WriteElementString('Title','Constituency');
                      //xmlWriter.WriteElementString('Value','');
                      //xmlWriter.WriteEndElement();
                    //Employee Metadata
                      //xmlWriter.WriteStartElement('Column');
                      //xmlWriter.WriteElementString('Title','Employee');
                      //xmlWriter.WriteElementString('Value',UserId);
                      //xmlWriter.WriteEndElement();
                      //xmlWriter.WriteEndDocument();
                      //xmlWriter.Close();
                    end;
                   //  // Filer.CopyClientFile(FileName,'X:\'+Docname+'.xml',TRUE);
                      //Filer.MoveFile(FileName,'\\192.168.0.86\DocumentsPath\'+Docname+'.xml');
                    end;
                  Message('Documents Uploaded Successffully');

    end;

    procedure FnUploadPurchaseInvoiceDocs(DocNo: Code[50];DocDesc: Text;TabID: RecordID): Boolean
    var
        DocType: Record "DMS Documents";
        DocLines: Record CBRECEIPTS;
        FileName: Text[250];
          //xmlWriter: dotnet XmlTextWriter;
          //EncodingText: dotnet Encoding;
    begin
              CashManagementSetup.Get;
              if CashManagementSetup.Find('-') then begin
                //Uploade File to folder
                 Docname:=DocNo;
                 Docname:=ConvertStr(Docname,':','_');
                 Docname:=ConvertStr(Docname,':','_');
                   //FileName:=Filer.OpenFileDialog('Select Document To Upload','Select Document To Upload','PDF Files (*.PDF)|*.PDF|All files (*.*)|*.*');
                   //FileName2:='\\192.168.0.95\DocumentsPath\'+Docname+'_'+Filer.GetFileName(FileName);
                  //FileDesc:=Docname+'_'+Filer.GetFileName(FileName);
                 // Filer.CopyClientFile(FileName,FileName2,true);
                  //Filer.MoveFile(FileName2,'\\192.168.0.86\DocumentsPath\'+FileDesc);
               // CopyClientFile(FileName,'X:\'+FileName2,TRUE);
                //Insert Link
                DocLink.Init;
                DocLink."Link ID":=0;
                DocLink.URL1:=CashManagementSetup."SharePoint Site Link"+'/'+CashManagementSetup."SharePoint Site Main Library"+'/'+CashManagementSetup."SharePoint Document Library"+'/'+CashManagementSetup."Payment Voucher DMS Link"+'/'+
                Docname+'/'+FileDesc;
                DocLink.Description:=FileDesc;
                DocLink.Type:=DocLink.Type::Link;
                DocLink.Company:=COMPANYNAME;
                DocLink."User ID":=UserId;
                DocLink.Created:=CreateDatetime(Today,Time);
                DocLink."Record ID":=TabID;
                DocLink.Insert;

                //Create Xml Document
                  CashManagementSetup.Get;
                  if CashManagementSetup.Find('-') then begin
                    XmlFileName:='\\192.168.0.86\DocumentsPath\'+Docname+'.xml';
                    FileName :='\\192.168.0.86\DocumentsPath\'+Docname+'.xml';
                    //FileName :=Docname+'.xml';
                       //if IsNull(  //xmlWriter) then
                      //xmlWriter :=   //xmlWriter.XmlTextWriter(XmlFileName, EncodingText.UTF8);
                      //xmlWriter.WriteStartDocument();
                    //Create Parent element
                      //xmlWriter.WriteStartElement('Columns');
                      //xmlWriter.WriteStartElement('Params');
                      //xmlWriter.WriteElementString('Library',CashManagementSetup."SharePoint Site Main Library");
                      //xmlWriter.WriteElementString('Folder',CashManagementSetup."SharePoint Document Library"+'/'+CashManagementSetup."Payment Voucher DMS Link"+'/'+Docname);
                      //xmlWriter.WriteEndElement();
                      //xmlWriter.WriteStartElement('Files');
                      //xmlWriter.WriteElementString('Filename',FileDesc);
                      //xmlWriter.WriteEndElement();
                     //Region Metadata
                      //xmlWriter.WriteStartElement('Column');
                    // REPEAT
                    //Create Child elements
                      //xmlWriter.WriteElementString('Title','Region');
                      //xmlWriter.WriteElementString('Value','');
                    //   //xmlWriter.WriteEndElement();
                    // UNTIL DocLines.NEXT = 0;
                    //End writing top element and XML document
                      //xmlWriter.WriteEndElement();
                   //Constituency Metadata
                      //xmlWriter.WriteStartElement('Column');
                      //xmlWriter.WriteElementString('Title','Constituency');
                      //xmlWriter.WriteElementString('Value','');
                      //xmlWriter.WriteEndElement();
                    //Employee Metadata
                      //xmlWriter.WriteStartElement('Column');
                      //xmlWriter.WriteElementString('Title','Employee');
                      //xmlWriter.WriteElementString('Value',UserId);
                      //xmlWriter.WriteEndElement();
                      //xmlWriter.WriteEndDocument();
                      //xmlWriter.Close();
                    end;
                   //  // Filer.CopyClientFile(FileName,'X:\'+Docname+'.xml',TRUE);
                      //Filer.MoveFile(FileName,'\\192.168.0.86\DocumentsPath\'+Docname+'.xml');
                    end;
                  Message('Documents Uploaded Successffully');

    end;

    procedure FnUploadStaffClaimDocs(DocNo: Code[50];DocDesc: Text;TabID: RecordID): Boolean
    var
        DocType: Record "DMS Documents";
        DocLines: Record CBRECEIPTS;
        FileName: Text[250];
          //xmlWriter: dotnet XmlTextWriter;
          //EncodingText: dotnet Encoding;
    begin
              CashManagementSetup.Get;
              if CashManagementSetup.Find('-') then begin
                //Uploade File to folder
                 Docname:=DocNo;
                 Docname:=ConvertStr(Docname,':','_');
                 Docname:=ConvertStr(Docname,':','_');
                   //FileName:=Filer.OpenFileDialog('Select Document To Upload','Select Document To Upload','PDF Files (*.PDF)|*.PDF|All files (*.*)|*.*');
                   //FileName2:='\\192.168.0.95\DocumentsPath\'+Docname+'_'+Filer.GetFileName(FileName);
                  //FileDesc:=Docname+'_'+Filer.GetFileName(FileName);
                 // Filer.CopyClientFile(FileName,FileName2,true);
                  //Filer.MoveFile(FileName2,'\\192.168.0.86\DocumentsPath\'+FileDesc);
               // CopyClientFile(FileName,'X:\'+FileName2,TRUE);
                //Insert Link
                DocLink.Init;
                DocLink."Link ID":=0;
                DocLink.URL1:=CashManagementSetup."SharePoint Site Link"+'/'+CashManagementSetup."SharePoint Site Main Library"+'/'+CashManagementSetup."SharePoint Document Library"+'/'+CashManagementSetup."Staff Claims DMS Link"+'/'+
                Docname+'/'+FileDesc;
                DocLink.Description:=FileDesc;
                DocLink.Type:=DocLink.Type::Link;
                DocLink.Company:=COMPANYNAME;
                DocLink."User ID":=UserId;
                DocLink.Created:=CreateDatetime(Today,Time);
                DocLink."Record ID":=TabID;
                DocLink.Insert;

                //Create Xml Document
                  CashManagementSetup.Get;
                  if CashManagementSetup.Find('-') then begin
                    XmlFileName:='\\192.168.0.86\DocumentsPath\'+Docname+'.xml';
                    FileName :='\\192.168.0.86\DocumentsPath\'+Docname+'.xml';
                    //FileName :=Docname+'.xml';
                       //if IsNull(  //xmlWriter) then
                      //xmlWriter :=   //xmlWriter.XmlTextWriter(XmlFileName, EncodingText.UTF8);
                      //xmlWriter.WriteStartDocument();
                    //Create Parent element
                      //xmlWriter.WriteStartElement('Columns');
                      //xmlWriter.WriteStartElement('Params');
                      //xmlWriter.WriteElementString('Library',CashManagementSetup."SharePoint Site Main Library");
                      //xmlWriter.WriteElementString('Folder',CashManagementSetup."SharePoint Document Library"+'/'+CashManagementSetup."Staff Claims DMS Link"+'/'+Docname);
                      //xmlWriter.WriteEndElement();
                      //xmlWriter.WriteStartElement('Files');
                      //xmlWriter.WriteElementString('Filename',FileDesc);
                      //xmlWriter.WriteEndElement();
                     //Region Metadata
                      //xmlWriter.WriteStartElement('Column');
                    // REPEAT
                    //Create Child elements
                      //xmlWriter.WriteElementString('Title','Region');
                      //xmlWriter.WriteElementString('Value','');
                    //   //xmlWriter.WriteEndElement();
                    // UNTIL DocLines.NEXT = 0;
                    //End writing top element and XML document
                      //xmlWriter.WriteEndElement();
                   //Constituency Metadata
                      //xmlWriter.WriteStartElement('Column');
                      //xmlWriter.WriteElementString('Title','Constituency');
                      //xmlWriter.WriteElementString('Value','');
                      //xmlWriter.WriteEndElement();
                    //Employee Metadata
                      //xmlWriter.WriteStartElement('Column');
                      //xmlWriter.WriteElementString('Title','Employee');
                      //xmlWriter.WriteElementString('Value',UserId);
                      //xmlWriter.WriteEndElement();
                      //xmlWriter.WriteEndDocument();
                      //xmlWriter.Close();
                    end;
                   //  // Filer.CopyClientFile(FileName,'X:\'+Docname+'.xml',TRUE);
                      //Filer.MoveFile(FileName,'\\192.168.0.86\DocumentsPath\'+Docname+'.xml');
                    end;
                  Message('Documents Uploaded Successffully');

    end;

    procedure FnUploadPettycashSurrenderDocs(DocNo: Code[50];DocDesc: Text;TabID: RecordID): Boolean
    var
        DocType: Record "DMS Documents";
        DocLines: Record CBRECEIPTS;
        FileName: Text[250];
          //xmlWriter: dotnet XmlTextWriter;
          //EncodingText: dotnet Encoding;
    begin
              CashManagementSetup.Get;
              if CashManagementSetup.Find('-') then begin
                //Uploade File to folder
                 Docname:=DocNo;
                 Docname:=ConvertStr(Docname,':','_');
                 Docname:=ConvertStr(Docname,':','_');
                   //FileName:=Filer.OpenFileDialog('Select Document To Upload','Select Document To Upload','PDF Files (*.PDF)|*.PDF|All files (*.*)|*.*');
                   //FileName2:='\\192.168.0.95\DocumentsPath\'+Docname+'_'+Filer.GetFileName(FileName);
                  //FileDesc:=Docname+'_'+Filer.GetFileName(FileName);
                 // Filer.CopyClientFile(FileName,FileName2,true);
                  //Filer.MoveFile(FileName2,'\\192.168.0.86\DocumentsPath\'+FileDesc);
               // CopyClientFile(FileName,'X:\'+FileName2,TRUE);
                //Insert Link
                DocLink.Init;
                DocLink."Link ID":=0;
                DocLink.URL1:=CashManagementSetup."SharePoint Site Link"+'/'+CashManagementSetup."SharePoint Site Main Library"+'/'+CashManagementSetup."SharePoint Document Library"+'/'+CashManagementSetup."Petty Cash Surrender DMS Link"+'/'+
                Docname+'/'+FileDesc;
                DocLink.Description:=FileDesc;
                DocLink.Type:=DocLink.Type::Link;
                DocLink.Company:=COMPANYNAME;
                DocLink."User ID":=UserId;
                DocLink.Created:=CreateDatetime(Today,Time);
                DocLink."Record ID":=TabID;
                DocLink.Insert;

                //Create Xml Document
                  CashManagementSetup.Get;
                  if CashManagementSetup.Find('-') then begin
                    XmlFileName:='\\192.168.0.86\DocumentsPath\'+Docname+'.xml';
                    FileName :='\\192.168.0.86\DocumentsPath\'+Docname+'.xml';
                    //FileName :=Docname+'.xml';
                       //if IsNull(  //xmlWriter) then
                      //xmlWriter :=   //xmlWriter.XmlTextWriter(XmlFileName, EncodingText.UTF8);
                      //xmlWriter.WriteStartDocument();
                    //Create Parent element
                      //xmlWriter.WriteStartElement('Columns');
                      //xmlWriter.WriteStartElement('Params');
                      //xmlWriter.WriteElementString('Library',CashManagementSetup."SharePoint Site Main Library");
                      //xmlWriter.WriteElementString('Folder',CashManagementSetup."SharePoint Document Library"+'/'+CashManagementSetup."Petty Cash Surrender DMS Link"+'/'+Docname);
                      //xmlWriter.WriteEndElement();
                      //xmlWriter.WriteStartElement('Files');
                      //xmlWriter.WriteElementString('Filename',FileDesc);
                      //xmlWriter.WriteEndElement();
                     //Region Metadata
                      //xmlWriter.WriteStartElement('Column');
                    // REPEAT
                    //Create Child elements
                      //xmlWriter.WriteElementString('Title','Region');
                      //xmlWriter.WriteElementString('Value','');
                    //   //xmlWriter.WriteEndElement();
                    // UNTIL DocLines.NEXT = 0;
                    //End writing top element and XML document
                      //xmlWriter.WriteEndElement();
                   //Constituency Metadata
                      //xmlWriter.WriteStartElement('Column');
                      //xmlWriter.WriteElementString('Title','Constituency');
                      //xmlWriter.WriteElementString('Value','');
                      //xmlWriter.WriteEndElement();
                    //Employee Metadata
                      //xmlWriter.WriteStartElement('Column');
                      //xmlWriter.WriteElementString('Title','Employee');
                      //xmlWriter.WriteElementString('Value',UserId);
                      //xmlWriter.WriteEndElement();
                      //xmlWriter.WriteEndDocument();
                      //xmlWriter.Close();
                    end;
                   //  // Filer.CopyClientFile(FileName,'X:\'+Docname+'.xml',TRUE);
                      //Filer.MoveFile(FileName,'\\192.168.0.86\DocumentsPath\'+Docname+'.xml');
                    end;
                  Message('Documents Uploaded Successffully');

    end;

    procedure FnUploadPurchaseOrderDocs(DocNo: Code[50];DocDesc: Text;TabID: RecordID): Boolean
    var
        DocType: Record "DMS Documents";
        DocLines: Record CBRECEIPTS;
        FileName: Text[250];
          //xmlWriter: dotnet XmlTextWriter;
          //EncodingText: dotnet Encoding;
    begin
              CashManagementSetup.Get;
              if CashManagementSetup.Find('-') then begin
                //Uploade File to folder
                 Docname:=DocNo;
                 Docname:=ConvertStr(Docname,':','_');
                 Docname:=ConvertStr(Docname,':','_');
                   //FileName:=Filer.OpenFileDialog('Select Document To Upload','Select Document To Upload','PDF Files (*.PDF)|*.PDF|All files (*.*)|*.*');
                   //FileName2:='\\192.168.0.95\DocumentsPath\'+Docname+'_'+Filer.GetFileName(FileName);
                  //FileDesc:=Docname+'_'+Filer.GetFileName(FileName);
                 // Filer.CopyClientFile(FileName,FileName2,true);
                  //Filer.MoveFile(FileName2,'\\192.168.0.86\DocumentsPath\'+FileDesc);
               // CopyClientFile(FileName,'X:\'+FileName2,TRUE);
                //Insert Link
                DocLink.Init;
                DocLink."Link ID":=0;
                DocLink.URL1:=CashManagementSetup."SharePoint Site Link"+'/'+CashManagementSetup."SharePoint Site Main Library"+'/'+CashManagementSetup."SharePoint Document Library"+'/'+CashManagementSetup."Purchase Order DMS Link"+'/'+
                Docname+'/'+FileDesc;
                DocLink.Description:=FileDesc;
                DocLink.Type:=DocLink.Type::Link;
                DocLink.Company:=COMPANYNAME;
                DocLink."User ID":=UserId;
                DocLink.Created:=CreateDatetime(Today,Time);
                DocLink."Record ID":=TabID;
                DocLink.Insert;

                //Create Xml Document
                  CashManagementSetup.Get;
                  if CashManagementSetup.Find('-') then begin
                    XmlFileName:='\\192.168.0.86\DocumentsPath\'+Docname+'.xml';
                    FileName :='\\192.168.0.86\DocumentsPath\'+Docname+'.xml';
                    //FileName :=Docname+'.xml';
                       //if IsNull(  //xmlWriter) then
                      //xmlWriter :=   //xmlWriter.XmlTextWriter(XmlFileName, EncodingText.UTF8);
                      //xmlWriter.WriteStartDocument();
                    //Create Parent element
                      //xmlWriter.WriteStartElement('Columns');
                      //xmlWriter.WriteStartElement('Params');
                      //xmlWriter.WriteElementString('Library',CashManagementSetup."SharePoint Site Main Library");
                      //xmlWriter.WriteElementString('Folder',CashManagementSetup."SharePoint Document Library"+'/'+CashManagementSetup."Purchase Order DMS Link"+'/'+Docname);
                      //xmlWriter.WriteEndElement();
                      //xmlWriter.WriteStartElement('Files');
                      //xmlWriter.WriteElementString('Filename',FileDesc);
                      //xmlWriter.WriteEndElement();
                     //Region Metadata
                      //xmlWriter.WriteStartElement('Column');
                    // REPEAT
                    //Create Child elements
                      //xmlWriter.WriteElementString('Title','Region');
                      //xmlWriter.WriteElementString('Value','');
                    //   //xmlWriter.WriteEndElement();
                    // UNTIL DocLines.NEXT = 0;
                    //End writing top element and XML document
                      //xmlWriter.WriteEndElement();
                   //Constituency Metadata
                      //xmlWriter.WriteStartElement('Column');
                      //xmlWriter.WriteElementString('Title','Constituency');
                      //xmlWriter.WriteElementString('Value','');
                      //xmlWriter.WriteEndElement();
                    //Employee Metadata
                      //xmlWriter.WriteStartElement('Column');
                      //xmlWriter.WriteElementString('Title','Employee');
                      //xmlWriter.WriteElementString('Value',UserId);
                      //xmlWriter.WriteEndElement();
                      //xmlWriter.WriteEndDocument();
                      //xmlWriter.Close();
                    end;
                   //  // Filer.CopyClientFile(FileName,'X:\'+Docname+'.xml',TRUE);
                      //Filer.MoveFile(FileName,'\\192.168.0.86\DocumentsPath\'+Docname+'.xml');
                    end;
                  Message('Documents Uploaded Successffully');

    end;

    procedure FnUploadStudentCaseDocs(DocNo: Code[50];DocDesc: Text;TabID: RecordID): Boolean
    var
        DocType: Record "DMS Documents";
        DocLines: Record CBRECEIPTS;
        FileName: Text[250];
          //xmlWriter: dotnet XmlTextWriter;
          //EncodingText: dotnet Encoding;
    begin
              CashManagementSetup.Get;
              if CashManagementSetup.Find('-') then begin
                //Uploade File to folder
                 Docname:=DocNo;
                 Docname:=ConvertStr(Docname,':','_');
                 Docname:=ConvertStr(Docname,':','_');
                   //FileName:=Filer.OpenFileDialog('Select Document To Upload','Select Document To Upload','PDF Files (*.PDF)|*.PDF|All files (*.*)|*.*');
                   //FileName2:='\\192.168.0.95\DocumentsPath\'+Docname+'_'+Filer.GetFileName(FileName);
                  //FileDesc:=Docname+'_'+Filer.GetFileName(FileName);
                 // Filer.CopyClientFile(FileName,FileName2,true);
                  //Filer.MoveFile(FileName2,'\\192.168.0.86\DocumentsPath\'+FileDesc);
               // CopyClientFile(FileName,'X:\'+FileName2,TRUE);
                //Insert Link
                DocLink.Init;
                DocLink."Link ID":=0;
                DocLink.URL1:=CashManagementSetup."SharePoint Site Link"+'/'+CashManagementSetup."SharePoint Site Main Library"+'/'+CashManagementSetup."SharePoint Document Library"+'/'+CashManagementSetup."Student Cases DMS Link"+'/'+
                Docname+'/'+FileDesc;
                DocLink.Description:=FileDesc;
                DocLink.Type:=DocLink.Type::Link;
                DocLink.Company:=COMPANYNAME;
                DocLink."User ID":=UserId;
                DocLink.Created:=CreateDatetime(Today,Time);
                DocLink."Record ID":=TabID;
                DocLink.Insert;

                //Create Xml Document
                  CashManagementSetup.Get;
                  if CashManagementSetup.Find('-') then begin
                    XmlFileName:='\\192.168.0.86\DocumentsPath\'+Docname+'.xml';
                    FileName :='\\192.168.0.86\DocumentsPath\'+Docname+'.xml';
                    //FileName :=Docname+'.xml';
                       //if IsNull(  //xmlWriter) then
                      //xmlWriter :=   //xmlWriter.XmlTextWriter(XmlFileName, EncodingText.UTF8);
                      //xmlWriter.WriteStartDocument();
                    //Create Parent element
                      //xmlWriter.WriteStartElement('Columns');
                      //xmlWriter.WriteStartElement('Params');
                      //xmlWriter.WriteElementString('Library',CashManagementSetup."SharePoint Site Main Library");
                      //xmlWriter.WriteElementString('Folder',CashManagementSetup."SharePoint Document Library"+'/'+CashManagementSetup."Student Cases DMS Link"+'/'+Docname);
                      //xmlWriter.WriteEndElement();
                      //xmlWriter.WriteStartElement('Files');
                      //xmlWriter.WriteElementString('Filename',FileDesc);
                      //xmlWriter.WriteEndElement();
                     //Region Metadata
                      //xmlWriter.WriteStartElement('Column');
                    // REPEAT
                    //Create Child elements
                      //xmlWriter.WriteElementString('Title','Region');
                      //xmlWriter.WriteElementString('Value','');
                    //   //xmlWriter.WriteEndElement();
                    // UNTIL DocLines.NEXT = 0;
                    //End writing top element and XML document
                      //xmlWriter.WriteEndElement();
                   //Constituency Metadata
                      //xmlWriter.WriteStartElement('Column');
                      //xmlWriter.WriteElementString('Title','Constituency');
                      //xmlWriter.WriteElementString('Value','');
                      //xmlWriter.WriteEndElement();
                    //Employee Metadata
                      //xmlWriter.WriteStartElement('Column');
                      //xmlWriter.WriteElementString('Title','Employee');
                      //xmlWriter.WriteElementString('Value',UserId);
                      //xmlWriter.WriteEndElement();
                      //xmlWriter.WriteEndDocument();
                      //xmlWriter.Close();
                    end;
                   //  // Filer.CopyClientFile(FileName,'X:\'+Docname+'.xml',TRUE);
                      //Filer.MoveFile(FileName,'\\192.168.0.86\DocumentsPath\'+Docname+'.xml');
                    end;
                  Message('Documents Uploaded Successffully');

    end;

    procedure FnUploadWorkticketDocs(DocNo: Code[50];DocDesc: Text;TabID: RecordID): Boolean
    var
        DocType: Record "DMS Documents";
        DocLines: Record CBRECEIPTS;
        FileName: Text[250];
          //xmlWriter: dotnet XmlTextWriter;
          //EncodingText: dotnet Encoding;
    begin
              CashManagementSetup.Get;
              if CashManagementSetup.Find('-') then begin
                //Uploade File to folder
                 Docname:=DocNo;
                 Docname:=ConvertStr(Docname,':','_');
                 Docname:=ConvertStr(Docname,':','_');
                   //FileName:=Filer.OpenFileDialog('Select Document To Upload','Select Document To Upload','PDF Files (*.PDF)|*.PDF|All files (*.*)|*.*');
                   //FileName2:='\\192.168.0.95\DocumentsPath\'+Docname+'_'+Filer.GetFileName(FileName);
                  //FileDesc:=Docname+'_'+Filer.GetFileName(FileName);
                 // Filer.CopyClientFile(FileName,FileName2,true);
                  //Filer.MoveFile(FileName2,'\\192.168.0.86\DocumentsPath\'+FileDesc);
               // CopyClientFile(FileName,'X:\'+FileName2,TRUE);
                //Insert Link
                DocLink.Init;
                DocLink."Link ID":=0;
                DocLink.URL1:=CashManagementSetup."SharePoint Site Link"+'/'+CashManagementSetup."SharePoint Site Main Library"+'/'+CashManagementSetup."SharePoint Document Library"+'/'+CashManagementSetup."Daily Work Ticket  DMS Link"+'/'+
                Docname+'/'+FileDesc;
                DocLink.Description:=FileDesc;
                DocLink.Type:=DocLink.Type::Link;
                DocLink.Company:=COMPANYNAME;
                DocLink."User ID":=UserId;
                DocLink.Created:=CreateDatetime(Today,Time);
                DocLink."Record ID":=TabID;
                DocLink.Insert;

                //Create Xml Document
                  CashManagementSetup.Get;
                  if CashManagementSetup.Find('-') then begin
                    XmlFileName:='\\192.168.0.86\DocumentsPath\'+Docname+'.xml';
                    FileName :='\\192.168.0.86\DocumentsPath\'+Docname+'.xml';
                    //FileName :=Docname+'.xml';
                       //if IsNull(  //xmlWriter) then
                      //xmlWriter :=   //xmlWriter.XmlTextWriter(XmlFileName, EncodingText.UTF8);
                      //xmlWriter.WriteStartDocument();
                    //Create Parent element
                      //xmlWriter.WriteStartElement('Columns');
                      //xmlWriter.WriteStartElement('Params');
                      //xmlWriter.WriteElementString('Library',CashManagementSetup."SharePoint Site Main Library");
                      //xmlWriter.WriteElementString('Folder',CashManagementSetup."SharePoint Document Library"+'/'+CashManagementSetup."Daily Work Ticket  DMS Link"+'/'+Docname);
                      //xmlWriter.WriteEndElement();
                      //xmlWriter.WriteStartElement('Files');
                      //xmlWriter.WriteElementString('Filename',FileDesc);
                      //xmlWriter.WriteEndElement();
                     //Region Metadata
                      //xmlWriter.WriteStartElement('Column');
                    // REPEAT
                    //Create Child elements
                      //xmlWriter.WriteElementString('Title','Region');
                      //xmlWriter.WriteElementString('Value','');
                    //   //xmlWriter.WriteEndElement();
                    // UNTIL DocLines.NEXT = 0;
                    //End writing top element and XML document
                      //xmlWriter.WriteEndElement();
                   //Constituency Metadata
                      //xmlWriter.WriteStartElement('Column');
                      //xmlWriter.WriteElementString('Title','Constituency');
                      //xmlWriter.WriteElementString('Value','');
                      //xmlWriter.WriteEndElement();
                    //Employee Metadata
                      //xmlWriter.WriteStartElement('Column');
                      //xmlWriter.WriteElementString('Title','Employee');
                      //xmlWriter.WriteElementString('Value',UserId);
                      //xmlWriter.WriteEndElement();
                      //xmlWriter.WriteEndDocument();
                      //xmlWriter.Close();
                    end;
                   //  // Filer.CopyClientFile(FileName,'X:\'+Docname+'.xml',TRUE);
                      //Filer.MoveFile(FileName,'\\192.168.0.86\DocumentsPath\'+Docname+'.xml');
                    end;
                  Message('Documents Uploaded Successffully');

    end;

    procedure FnUploadPropertyRepotDocs(DocNo: Code[50];DocDesc: Text;TabID: RecordID): Boolean
    var
        DocType: Record "DMS Documents";
        DocLines: Record CBRECEIPTS;
        FileName: Text[250];
          //xmlWriter: dotnet XmlTextWriter;
          //EncodingText: dotnet Encoding;
    begin
              CashManagementSetup.Get;
              if CashManagementSetup.Find('-') then begin
                //Uploade File to folder
                 Docname:=DocNo;
                 Docname:=ConvertStr(Docname,':','_');
                 Docname:=ConvertStr(Docname,':','_');
                   //FileName:=Filer.OpenFileDialog('Select Document To Upload','Select Document To Upload','PDF Files (*.PDF)|*.PDF|All files (*.*)|*.*');
                   //FileName2:='\\192.168.0.95\DocumentsPath\'+Docname+'_'+Filer.GetFileName(FileName);
                  //FileDesc:=Docname+'_'+Filer.GetFileName(FileName);
                 // Filer.CopyClientFile(FileName,FileName2,true);
                  //Filer.MoveFile(FileName2,'\\192.168.0.86\DocumentsPath\'+FileDesc);
               // CopyClientFile(FileName,'X:\'+FileName2,TRUE);
                //Insert Link
                DocLink.Init;
                DocLink."Link ID":=0;
                DocLink.URL1:=CashManagementSetup."SharePoint Site Link"+'/'+CashManagementSetup."SharePoint Site Main Library"+'/'+CashManagementSetup."SharePoint Document Library"+'/'+CashManagementSetup."Property Reports  DMS Link"+'/'+
                Docname+'/'+FileDesc;
                DocLink.Description:=FileDesc;
                DocLink.Type:=DocLink.Type::Link;
                DocLink.Company:=COMPANYNAME;
                DocLink."User ID":=UserId;
                DocLink.Created:=CreateDatetime(Today,Time);
                DocLink."Record ID":=TabID;
                DocLink.Insert;

                //Create Xml Document
                  CashManagementSetup.Get;
                  if CashManagementSetup.Find('-') then begin
                    XmlFileName:='\\192.168.0.86\DocumentsPath\'+Docname+'.xml';
                    FileName :='\\192.168.0.86\DocumentsPath\'+Docname+'.xml';
                    //FileName :=Docname+'.xml';
                       //if IsNull(  //xmlWriter) then
                      //xmlWriter :=   //xmlWriter.XmlTextWriter(XmlFileName, EncodingText.UTF8);
                      //xmlWriter.WriteStartDocument();
                    //Create Parent element
                      //xmlWriter.WriteStartElement('Columns');
                      //xmlWriter.WriteStartElement('Params');
                      //xmlWriter.WriteElementString('Library',CashManagementSetup."SharePoint Site Main Library");
                      //xmlWriter.WriteElementString('Folder',CashManagementSetup."SharePoint Document Library"+'/'+CashManagementSetup."Property Reports  DMS Link"+'/'+Docname);
                      //xmlWriter.WriteEndElement();
                      //xmlWriter.WriteStartElement('Files');
                      //xmlWriter.WriteElementString('Filename',FileDesc);
                      //xmlWriter.WriteEndElement();
                     //Region Metadata
                      //xmlWriter.WriteStartElement('Column');
                    // REPEAT
                    //Create Child elements
                      //xmlWriter.WriteElementString('Title','Region');
                      //xmlWriter.WriteElementString('Value','');
                    //   //xmlWriter.WriteEndElement();
                    // UNTIL DocLines.NEXT = 0;
                    //End writing top element and XML document
                      //xmlWriter.WriteEndElement();
                   //Constituency Metadata
                      //xmlWriter.WriteStartElement('Column');
                      //xmlWriter.WriteElementString('Title','Constituency');
                      //xmlWriter.WriteElementString('Value','');
                      //xmlWriter.WriteEndElement();
                    //Employee Metadata
                      //xmlWriter.WriteStartElement('Column');
                      //xmlWriter.WriteElementString('Title','Employee');
                      //xmlWriter.WriteElementString('Value',UserId);
                      //xmlWriter.WriteEndElement();
                      //xmlWriter.WriteEndDocument();
                      //xmlWriter.Close();
                    end;
                   //  // Filer.CopyClientFile(FileName,'X:\'+Docname+'.xml',TRUE);
                      //Filer.MoveFile(FileName,'\\192.168.0.86\DocumentsPath\'+Docname+'.xml');
                    end;
                  Message('Documents Uploaded Successffully');

    end;

    procedure FnUploadInsuranceClaimtDocs(DocNo: Code[50];DocDesc: Text;TabID: RecordID): Boolean
    var
        DocType: Record "DMS Documents";
        DocLines: Record CBRECEIPTS;
        FileName: Text[250];
          //xmlWriter: dotnet XmlTextWriter;
          //EncodingText: dotnet Encoding;
    begin
              CashManagementSetup.Get;
              if CashManagementSetup.Find('-') then begin
                //Uploade File to folder
                 Docname:=DocNo;
                 Docname:=ConvertStr(Docname,':','_');
                 Docname:=ConvertStr(Docname,':','_');
                   //FileName:=Filer.OpenFileDialog('Select Document To Upload','Select Document To Upload','PDF Files (*.PDF)|*.PDF|All files (*.*)|*.*');
                   //FileName2:='\\192.168.0.95\DocumentsPath\'+Docname+'_'+Filer.GetFileName(FileName);
                  //FileDesc:=Docname+'_'+Filer.GetFileName(FileName);
                 // Filer.CopyClientFile(FileName,FileName2,true);
                  //Filer.MoveFile(FileName2,'\\192.168.0.86\DocumentsPath\'+FileDesc);
               // CopyClientFile(FileName,'X:\'+FileName2,TRUE);
                //Insert Link
                DocLink.Init;
                DocLink."Link ID":=0;
                DocLink.URL1:=CashManagementSetup."SharePoint Site Link"+'/'+CashManagementSetup."SharePoint Site Main Library"+'/'+CashManagementSetup."SharePoint Document Library"+'/'+CashManagementSetup."Insurance Claim  DMS Link"+'/'+
                Docname+'/'+FileDesc;
                DocLink.Description:=FileDesc;
                DocLink.Type:=DocLink.Type::Link;
                DocLink.Company:=COMPANYNAME;
                DocLink."User ID":=UserId;
                DocLink.Created:=CreateDatetime(Today,Time);
                DocLink."Record ID":=TabID;
                DocLink.Insert;

                //Create Xml Document
                  CashManagementSetup.Get;
                  if CashManagementSetup.Find('-') then begin
                    XmlFileName:='\\192.168.0.86\DocumentsPath\'+Docname+'.xml';
                    FileName :='\\192.168.0.86\DocumentsPath\'+Docname+'.xml';
                    //FileName :=Docname+'.xml';
                       //if IsNull(  //xmlWriter) then
                      //xmlWriter :=   //xmlWriter.XmlTextWriter(XmlFileName, EncodingText.UTF8);
                      //xmlWriter.WriteStartDocument();
                    //Create Parent element
                      //xmlWriter.WriteStartElement('Columns');
                      //xmlWriter.WriteStartElement('Params');
                      //xmlWriter.WriteElementString('Library',CashManagementSetup."SharePoint Site Main Library");
                      //xmlWriter.WriteElementString('Folder',CashManagementSetup."SharePoint Document Library"+'/'+CashManagementSetup."Insurance Claim  DMS Link"+'/'+Docname);
                      //xmlWriter.WriteEndElement();
                      //xmlWriter.WriteStartElement('Files');
                      //xmlWriter.WriteElementString('Filename',FileDesc);
                      //xmlWriter.WriteEndElement();
                     //Region Metadata
                      //xmlWriter.WriteStartElement('Column');
                    // REPEAT
                    //Create Child elements
                      //xmlWriter.WriteElementString('Title','Region');
                      //xmlWriter.WriteElementString('Value','');
                    //   //xmlWriter.WriteEndElement();
                    // UNTIL DocLines.NEXT = 0;
                    //End writing top element and XML document
                      //xmlWriter.WriteEndElement();
                   //Constituency Metadata
                      //xmlWriter.WriteStartElement('Column');
                      //xmlWriter.WriteElementString('Title','Constituency');
                      //xmlWriter.WriteElementString('Value','');
                      //xmlWriter.WriteEndElement();
                    //Employee Metadata
                      //xmlWriter.WriteStartElement('Column');
                      //xmlWriter.WriteElementString('Title','Employee');
                      //xmlWriter.WriteElementString('Value',UserId);
                      //xmlWriter.WriteEndElement();
                      //xmlWriter.WriteEndDocument();
                      //xmlWriter.Close();
                    end;
                   //  // Filer.CopyClientFile(FileName,'X:\'+Docname+'.xml',TRUE);
                      //Filer.MoveFile(FileName,'\\192.168.0.86\DocumentsPath\'+Docname+'.xml');
                    end;
                  Message('Documents Uploaded Successffully');

    end;

    procedure FnUploadMedialSchemetDocs(DocNo: Code[50];DocDesc: Text;TabID: RecordID): Boolean
    var
        DocType: Record "DMS Documents";
        DocLines: Record CBRECEIPTS;
        FileName: Text[250];
          //xmlWriter: dotnet XmlTextWriter;
          //EncodingText: dotnet Encoding;
    begin
              CashManagementSetup.Get;
              if CashManagementSetup.Find('-') then begin
                //Uploade File to folder
                 Docname:=DocNo;
                 Docname:=ConvertStr(Docname,':','_');
                 Docname:=ConvertStr(Docname,':','_');
                   //FileName:=Filer.OpenFileDialog('Select Document To Upload','Select Document To Upload','PDF Files (*.PDF)|*.PDF|All files (*.*)|*.*');
                   //FileName2:='\\192.168.0.95\DocumentsPath\'+Docname+'_'+Filer.GetFileName(FileName);
                  //FileDesc:=Docname+'_'+Filer.GetFileName(FileName);
                 // Filer.CopyClientFile(FileName,FileName2,true);
                  //Filer.MoveFile(FileName2,'\\192.168.0.86\DocumentsPath\'+FileDesc);
               // CopyClientFile(FileName,'X:\'+FileName2,TRUE);
                //Insert Link
                DocLink.Init;
                DocLink."Link ID":=0;
                DocLink.URL1:=CashManagementSetup."SharePoint Site Link"+'/'+CashManagementSetup."SharePoint Site Main Library"+'/'+CashManagementSetup."SharePoint Document Library"+'/'+CashManagementSetup."Medical Claim  DMS Link"+'/'+
                Docname+'/'+FileDesc;
                DocLink.Description:=FileDesc;
                DocLink.Type:=DocLink.Type::Link;
                DocLink.Company:=COMPANYNAME;
                DocLink."User ID":=UserId;
                DocLink.Created:=CreateDatetime(Today,Time);
                DocLink."Record ID":=TabID;
                DocLink.Insert;

                //Create Xml Document
                  CashManagementSetup.Get;
                  if CashManagementSetup.Find('-') then begin
                    XmlFileName:='\\192.168.0.86\DocumentsPath\'+Docname+'.xml';
                    FileName :='\\192.168.0.86\DocumentsPath\'+Docname+'.xml';
                    //FileName :=Docname+'.xml';
                       //if IsNull(  //xmlWriter) then
                      //xmlWriter :=   //xmlWriter.XmlTextWriter(XmlFileName, EncodingText.UTF8);
                      //xmlWriter.WriteStartDocument();
                    //Create Parent element
                      //xmlWriter.WriteStartElement('Columns');
                      //xmlWriter.WriteStartElement('Params');
                      //xmlWriter.WriteElementString('Library',CashManagementSetup."SharePoint Site Main Library");
                      //xmlWriter.WriteElementString('Folder',CashManagementSetup."SharePoint Document Library"+'/'+CashManagementSetup."Medical Claim  DMS Link"+'/'+Docname);
                      //xmlWriter.WriteEndElement();
                      //xmlWriter.WriteStartElement('Files');
                      //xmlWriter.WriteElementString('Filename',FileDesc);
                      //xmlWriter.WriteEndElement();
                     //Region Metadata
                      //xmlWriter.WriteStartElement('Column');
                    // REPEAT
                    //Create Child elements
                      //xmlWriter.WriteElementString('Title','Region');
                      //xmlWriter.WriteElementString('Value','');
                    //   //xmlWriter.WriteEndElement();
                    // UNTIL DocLines.NEXT = 0;
                    //End writing top element and XML document
                      //xmlWriter.WriteEndElement();
                   //Constituency Metadata
                      //xmlWriter.WriteStartElement('Column');
                      //xmlWriter.WriteElementString('Title','Constituency');
                      //xmlWriter.WriteElementString('Value','');
                      //xmlWriter.WriteEndElement();
                    //Employee Metadata
                      //xmlWriter.WriteStartElement('Column');
                      //xmlWriter.WriteElementString('Title','Employee');
                      //xmlWriter.WriteElementString('Value',UserId);
                      //xmlWriter.WriteEndElement();
                      //xmlWriter.WriteEndDocument();
                      //xmlWriter.Close();
                    end;
                   //  // Filer.CopyClientFile(FileName,'X:\'+Docname+'.xml',TRUE);
                      //Filer.MoveFile(FileName,'\\192.168.0.86\DocumentsPath\'+Docname+'.xml');
                    end;
                  Message('Documents Uploaded Successffully');

    end;

    procedure FnUploadGatePassDocs(DocNo: Code[50];DocDesc: Text;TabID: RecordID): Boolean
    var
        DocType: Record "DMS Documents";
        DocLines: Record CBRECEIPTS;
        FileName: Text[250];
          //xmlWriter: dotnet XmlTextWriter;
          //EncodingText: dotnet Encoding;
    begin
              CashManagementSetup.Get;
              if CashManagementSetup.Find('-') then begin
                //Uploade File to folder
                 Docname:=DocNo;
                 Docname:=ConvertStr(Docname,':','_');
                 Docname:=ConvertStr(Docname,':','_');
                   //FileName:=Filer.OpenFileDialog('Select Document To Upload','Select Document To Upload','PDF Files (*.PDF)|*.PDF|All files (*.*)|*.*');
                   //FileName2:='\\192.168.0.95\DocumentsPath\'+Docname+'_'+Filer.GetFileName(FileName);
                  //FileDesc:=Docname+'_'+Filer.GetFileName(FileName);
                 // Filer.CopyClientFile(FileName,FileName2,true);
                  //Filer.MoveFile(FileName2,'\\192.168.0.86\DocumentsPath\'+FileDesc);
               // CopyClientFile(FileName,'X:\'+FileName2,TRUE);
                //Insert Link
                DocLink.Init;
                DocLink."Link ID":=0;
                DocLink.URL1:=CashManagementSetup."SharePoint Site Link"+'/'+CashManagementSetup."SharePoint Site Main Library"+'/'+CashManagementSetup."SharePoint Document Library"+'/'+CashManagementSetup."Gate Pass  DMS Link"+'/'+
                Docname+'/'+FileDesc;
                DocLink.Description:=FileDesc;
                DocLink.Type:=DocLink.Type::Link;
                DocLink.Company:=COMPANYNAME;
                DocLink."User ID":=UserId;
                DocLink.Created:=CreateDatetime(Today,Time);
                DocLink."Record ID":=TabID;
                DocLink.Insert;

                //Create Xml Document
                  CashManagementSetup.Get;
                  if CashManagementSetup.Find('-') then begin
                    XmlFileName:='\\192.168.0.86\DocumentsPath\'+Docname+'.xml';
                    FileName :='\\192.168.0.86\DocumentsPath\'+Docname+'.xml';
                    //FileName :=Docname+'.xml';
                       //if IsNull(  //xmlWriter) then
                      //xmlWriter :=   //xmlWriter.XmlTextWriter(XmlFileName, EncodingText.UTF8);
                      //xmlWriter.WriteStartDocument();
                    //Create Parent element
                      //xmlWriter.WriteStartElement('Columns');
                      //xmlWriter.WriteStartElement('Params');
                      //xmlWriter.WriteElementString('Library',CashManagementSetup."SharePoint Site Main Library");
                      //xmlWriter.WriteElementString('Folder',CashManagementSetup."SharePoint Document Library"+'/'+CashManagementSetup."Gate Pass  DMS Link"+'/'+Docname);
                      //xmlWriter.WriteEndElement();
                      //xmlWriter.WriteStartElement('Files');
                      //xmlWriter.WriteElementString('Filename',FileDesc);
                      //xmlWriter.WriteEndElement();
                     //Region Metadata
                      //xmlWriter.WriteStartElement('Column');
                    // REPEAT
                    //Create Child elements
                      //xmlWriter.WriteElementString('Title','Region');
                      //xmlWriter.WriteElementString('Value','');
                    //   //xmlWriter.WriteEndElement();
                    // UNTIL DocLines.NEXT = 0;
                    //End writing top element and XML document
                      //xmlWriter.WriteEndElement();
                   //Constituency Metadata
                      //xmlWriter.WriteStartElement('Column');
                      //xmlWriter.WriteElementString('Title','Constituency');
                      //xmlWriter.WriteElementString('Value','');
                      //xmlWriter.WriteEndElement();
                    //Employee Metadata
                      //xmlWriter.WriteStartElement('Column');
                      //xmlWriter.WriteElementString('Title','Employee');
                      //xmlWriter.WriteElementString('Value',UserId);
                      //xmlWriter.WriteEndElement();
                      //xmlWriter.WriteEndDocument();
                      //xmlWriter.Close();
                    end;
                   //  // Filer.CopyClientFile(FileName,'X:\'+Docname+'.xml',TRUE);
                      //Filer.MoveFile(FileName,'\\192.168.0.86\DocumentsPath\'+Docname+'.xml');
                    end;
                  Message('Documents Uploaded Successffully');

    end;

    procedure FnUploadMarkerClaimDocs(DocNo: Code[50];DocDesc: Text;TabID: RecordID): Boolean
    var
        DocType: Record "DMS Documents";
        DocLines: Record CBRECEIPTS;
        FileName: Text[250];
          //xmlWriter: dotnet XmlTextWriter;
          //EncodingText: dotnet Encoding;
    begin
              CashManagementSetup.Get;
              if CashManagementSetup.Find('-') then begin
                //Uploade File to folder
                 Docname:=DocNo;
                 Docname:=ConvertStr(Docname,':','_');
                 Docname:=ConvertStr(Docname,':','_');
                   //FileName:=Filer.OpenFileDialog('Select Document To Upload','Select Document To Upload','PDF Files (*.PDF)|*.PDF|All files (*.*)|*.*');
                   //FileName2:='\\192.168.0.95\DocumentsPath\'+Docname+'_'+Filer.GetFileName(FileName);
                  //FileDesc:=Docname+'_'+Filer.GetFileName(FileName);
                 // Filer.CopyClientFile(FileName,FileName2,true);
                  //Filer.MoveFile(FileName2,'\\192.168.0.86\DocumentsPath\'+FileDesc);
               // CopyClientFile(FileName,'X:\'+FileName2,TRUE);
                //Insert Link
                DocLink.Init;
                DocLink."Link ID":=0;
                DocLink.URL1:=CashManagementSetup."SharePoint Site Link"+'/'+CashManagementSetup."SharePoint Site Main Library"+'/'+CashManagementSetup."SharePoint Document Library"+'/'+CashManagementSetup."Marker Claim  DMS Link"+'/'+
                Docname+'/'+FileDesc;
                DocLink.Description:=FileDesc;
                DocLink.Type:=DocLink.Type::Link;
                DocLink.Company:=COMPANYNAME;
                DocLink."User ID":=UserId;
                DocLink.Created:=CreateDatetime(Today,Time);
                DocLink."Record ID":=TabID;
                DocLink.Insert;

                //Create Xml Document
                  CashManagementSetup.Get;
                  if CashManagementSetup.Find('-') then begin
                    XmlFileName:='\\192.168.0.86\DocumentsPath\'+Docname+'.xml';
                    FileName :='\\192.168.0.86\DocumentsPath\'+Docname+'.xml';
                    //FileName :=Docname+'.xml';
                       //if IsNull(  //xmlWriter) then
                      //xmlWriter :=   //xmlWriter.XmlTextWriter(XmlFileName, EncodingText.UTF8);
                      //xmlWriter.WriteStartDocument();
                    //Create Parent element
                      //xmlWriter.WriteStartElement('Columns');
                      //xmlWriter.WriteStartElement('Params');
                      //xmlWriter.WriteElementString('Library',CashManagementSetup."SharePoint Site Main Library");
                      //xmlWriter.WriteElementString('Folder',CashManagementSetup."SharePoint Document Library"+'/'+CashManagementSetup."Marker Claim  DMS Link"+'/'+Docname);
                      //xmlWriter.WriteEndElement();
                      //xmlWriter.WriteStartElement('Files');
                      //xmlWriter.WriteElementString('Filename',FileDesc);
                      //xmlWriter.WriteEndElement();
                     //Region Metadata
                      //xmlWriter.WriteStartElement('Column');
                    // REPEAT
                    //Create Child elements
                      //xmlWriter.WriteElementString('Title','Region');
                      //xmlWriter.WriteElementString('Value','');
                    //   //xmlWriter.WriteEndElement();
                    // UNTIL DocLines.NEXT = 0;
                    //End writing top element and XML document
                      //xmlWriter.WriteEndElement();
                   //Constituency Metadata
                      //xmlWriter.WriteStartElement('Column');
                      //xmlWriter.WriteElementString('Title','Constituency');
                      //xmlWriter.WriteElementString('Value','');
                      //xmlWriter.WriteEndElement();
                    //Employee Metadata
                      //xmlWriter.WriteStartElement('Column');
                      //xmlWriter.WriteElementString('Title','Employee');
                      //xmlWriter.WriteElementString('Value',UserId);
                      //xmlWriter.WriteEndElement();
                      //xmlWriter.WriteEndDocument();
                      //xmlWriter.Close();
                    end;
                   //  // Filer.CopyClientFile(FileName,'X:\'+Docname+'.xml',TRUE);
                      //Filer.MoveFile(FileName,'\\192.168.0.86\DocumentsPath\'+Docname+'.xml');
                    end;
                  Message('Documents Uploaded Successffully');

    end;
}

