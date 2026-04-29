#ifndef __CONSTRUTOR_V2_TAB7_SAIDAS_PARCIAIS_MQH__
#define __CONSTRUTOR_V2_TAB7_SAIDAS_PARCIAIS_MQH__

class CTab7SaidasParciaisV2 : public CConstrutorV2PlaceholderTab
  {
public:
   bool Create(int window_index,CEF_CTabs &tabs,const int tab_index)
     {
      return(CreatePlaceholder(window_index,tabs,tab_index,"Estrutura reservada para saidas parciais. Cada bloco de saida pode ser migrado aqui depois com independencia."));
     }
  };

#endif // __CONSTRUTOR_V2_TAB7_SAIDAS_PARCIAIS_MQH__
