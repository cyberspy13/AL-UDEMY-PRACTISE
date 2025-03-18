codeunit 50303 "My retention policies"
{
    Subtype = Install;
    trigger OnInstallAppPerCompany()
    var
        RetenPolAllowedTables: Codeunit "Reten. Pol. Allowed Tables";
    begin
        RetenPolAllowedTables.AddAllowedTable(Database::"My Log");
    end;
}