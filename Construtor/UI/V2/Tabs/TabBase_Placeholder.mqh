#ifndef __CONSTRUTOR_V2_TAB_BASE_PLACEHOLDER_MQH__
#define __CONSTRUTOR_V2_TAB_BASE_PLACEHOLDER_MQH__

class CConstrutorV2PlaceholderTab : public CEF_CWndCreate
  {
protected:
   CEF_CWndCreate    *m_host;
   bool              m_created;
   int               m_window_index;
   int               m_tab_index;
   CEF_CFrame        m_card;
   CEF_CTextLabel    m_body;

   bool CreatePlaceholder(CEF_CWndCreate &host,int window_index,CEF_CTabs &tabs,const int tab_index,const string body_text)
     {
      if(m_created)
         return(true);

      m_host=&host;
      m_window_index=window_index;
      m_tab_index=tab_index;

      const int content_pad=24;
      const int content_y=78;
      const int content_w=tabs.XSize()-(content_pad*2);
      const int content_h=tabs.YSize()-content_y-24;

      if(!CreateFrame(m_card,"",tabs,m_window_index,tabs,m_tab_index,content_pad,content_y,content_w,content_h,1))
         return(false);
      m_card.BackColor(V2_COLOR_CARD_BACK);
      m_card.BorderColor(V2_COLOR_CARD_BORDER);

      if(!CreateTextLabel(m_body,body_text,m_card,m_window_index,tabs,m_tab_index,18,18,content_w-36,48))
         return(false);
      m_body.FontSize(11);
      m_body.LabelColor(V2_COLOR_TEXT_SECONDARY);

      m_created=true;
      return(true);
     }

public:
                     CConstrutorV2PlaceholderTab(void) : m_host(NULL), m_created(false), m_window_index(-1), m_tab_index(-1) {}
  };

#endif // __CONSTRUTOR_V2_TAB_BASE_PLACEHOLDER_MQH__
