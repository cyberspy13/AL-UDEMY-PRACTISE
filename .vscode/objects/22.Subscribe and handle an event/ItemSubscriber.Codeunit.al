codeunit 50301 "Item Subscriber"
{
    [EventSubscriber(ObjectType::Table, Database::Item, OnBeforeValidateBaseUnitOfMeasure, '', false, false)]
    local procedure OnBeforeValidateBaseUnitOfMeasure(var Item: Record Item; xItem: Record Item; CallingFieldNo: Integer; var IsHandled: Boolean)
    begin
        IsHandled := true;

        message('This is a test message');
        /*
        My new logic to handle the OnValidate trigger

        

        */
    end;
}