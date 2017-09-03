import org.codehaus.groovy.grails.web.mapping.UrlMappingsHolderFactoryBean
import org.springframework.aop.framework.ProxyFactoryBean
import org.springframework.aop.target.HotSwappableTargetSource

// Place your Spring DSL code here
beans = {
    "org.grails.internal.URL_MAPPINGS_HOLDER"(UrlMappingsHolderFactoryBean) { bean ->
        bean.lazyInit = true
    }

    urlMappingsTargetSource(HotSwappableTargetSource, ref("org.grails.internal.URL_MAPPINGS_HOLDER")) { bean ->
        bean.lazyInit = true
    }

    grailsUrlMappingsHolder(ProxyFactoryBean) { bean ->
        bean.lazyInit = true
        targetSource = urlMappingsTargetSource
        proxyInterfaces = [org.codehaus.groovy.grails.web.mapping.UrlMappings]
    }
}
