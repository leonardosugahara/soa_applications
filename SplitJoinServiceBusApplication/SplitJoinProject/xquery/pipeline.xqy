xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns1="http://xmlns.oracle.com/SplitJoinSOAApplication/ProjectA/BPELProcessA";
(:: import schema at "../xsd/BPELProcessA.xsd" ::)
declare namespace ns2="http://xmlns.oracle.com/SplitJoinSOAApplication/ProjectB/BPELProcessB";
(:: import schema at "../xsd/BPELProcessB.xsd" ::)
declare namespace ns3="http://xmlns.oracle.com/SplitJoinSOAApplication/ProjectC/BPELProcessC";
(:: import schema at "../xsd/BPELProcessC.xsd" ::)
declare namespace ns4="http://xmlns.oracle.com/SplitJoinServiceBusApplication/SplitJoinProject/PipelineContract";
(:: import schema at "../wsdl/PipelineContract.wsdl" ::)

declare variable $bpelprocessaResponse as element() (:: schema-element(ns1:processResponse) ::) external;
declare variable $bpelprocessbResponse as element() (:: schema-element(ns2:processResponse) ::) external;
declare variable $bpelprocesscResponse as element() (:: schema-element(ns3:processResponse) ::) external;

declare function local:prepareResponse($bpelprocessaResponse as element() (:: schema-element(ns1:processResponse) ::), 
                                       $bpelprocessbResponse as element() (:: schema-element(ns2:processResponse) ::), 
                                       $bpelprocesscResponse as element() (:: schema-element(ns3:processResponse) ::)) 
                                       as element() (:: schema-element(ns4:result) ::) {
    <ns4:result>
        <ns4:resultBPELProcessA>{fn:data($bpelprocessaResponse/ns1:result)}</ns4:resultBPELProcessA>
        <ns4:resultBPELProcessB>{fn:data($bpelprocessbResponse/ns2:result)}</ns4:resultBPELProcessB>
        <ns4:resultBPELProcessC>{fn:data($bpelprocesscResponse/ns3:result)}</ns4:resultBPELProcessC>
    </ns4:result>
};

local:prepareResponse($bpelprocessaResponse, $bpelprocessbResponse, $bpelprocesscResponse)
