#ifndef __CONSTRUTOR_V2_TAB_EXECUCAO_MQH__
#define __CONSTRUTOR_V2_TAB_EXECUCAO_MQH__

class CTabExecucaoV2 : public CConstrutorV2PlaceholderTab
  {
public:
   bool Create(CEF_CWndCreate &host,int window_index,CEF_CTabs &tabs,const int tab_index)
     {
      return(CreatePlaceholder(host,window_index,tabs,tab_index,"Estrutura reservada para execucao. Use este arquivo para acoplar envio, ciclo operacional e estados da estrategia."));
     }
  };

#endif // __CONSTRUTOR_V2_TAB_EXECUCAO_MQH__
