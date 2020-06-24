FROM websphere-liberty:19.0.0.9-javaee7

COPY --chown=1001:0 daytrader-ee7-wlpcfg/servers/daytrader7Sample/apps/daytrader-ee7.ear /config/apps/daytrader-ee7.ear

COPY --chown=1001:0 daytrader-ee7-wlpcfg/servers/daytrader7Sample/server.xml /config/server.xml

#DERBY

COPY --chown=1001:0 daytrader-ee7-wlpcfg/shared/resources/Daytrader7SampleDerbyLibs/derby-10.10.1.1.jar /config/derby-10.10.1.1.jar

RUN /liberty/wlp/bin/installUtility install --acceptLicense defaultServer

ENV WLP_LOGGING_CONSOLE_FORMAT=JSON
ENV WLP_LOGGING_CONSOLE_LOGLEVEL=info
ENV WLP_LOGGING_CONSOLE_SOURCE=message,trace,accessLog,ffdc,audit

RUN configure.sh