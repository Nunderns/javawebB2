package listener;

import com.mysql.cj.jdbc.AbandonedConnectionCleanupThread;
import jakarta.servlet.ServletContextEvent;
import jakarta.servlet.ServletContextListener;
import jakarta.servlet.annotation.WebListener;

@WebListener
public class ContextCleanupListener implements ServletContextListener {

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        AbandonedConnectionCleanupThread.checkedShutdown();
        System.out.println("✅ Thread de limpeza do MySQL finalizada.");
    }

    @Override
    public void contextInitialized(ServletContextEvent sce) {
        // Nenhuma ação necessária ao iniciar
    }
}
