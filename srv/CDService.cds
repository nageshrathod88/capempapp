using { epm.db.CDSView } from '../db/CDSView';

service CDSViewSrv @(path:'CDSViewSrv') {
    entity PODetails as projection on CDSView.PODetails;
    entity ItemView as projection on CDSView.ItemView;  
    entity ProductSum as projection on CDSView.ProductSum;
    entity ProductSum1 as projection on CDSView.ProductSum;
}
