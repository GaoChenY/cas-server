package net.wangxj.authority.cas.validate;

import java.security.GeneralSecurityException;

import javax.security.auth.login.AccountNotFoundException;
import javax.security.auth.login.FailedLoginException;
import javax.validation.constraints.NotNull;

import org.jasig.cas.adaptors.jdbc.AbstractJdbcUsernamePasswordAuthenticationHandler;
import org.jasig.cas.authentication.HandlerResult;
import org.jasig.cas.authentication.PreventedException;
import org.jasig.cas.authentication.UsernamePasswordCredential;
import org.springframework.dao.DataAccessException;
import org.springframework.dao.IncorrectResultSizeDataAccessException;

import net.wangxj.authority.cas.captcha.UsernamePasswordCaptchaCredential;
import net.wangxj.util.encry.PBKDF2SHA1;

public class WangXJQueryDatabaseAuthenticationHandler extends WangXJAbstractJdbcUsernamePasswordAuthenticationHandler {
	
	 @NotNull
	    private String sql;

	    /**
	     * {@inheritDoc}
	     */
	    @Override
	    protected final HandlerResult authenticateUsernamePasswordInternal(final UsernamePasswordCaptchaCredential credential)
	            throws GeneralSecurityException, PreventedException {

	        final String username = credential.getUsername();
	        try {
	            final String dbPassword = getJdbcTemplate().queryForObject(this.sql, String.class, username);
	            
	            if (!PBKDF2SHA1.validatePassword(credential.getPassword(), dbPassword)) {
	                throw new FailedLoginException("Password does not match value on record.");
	            }
	        } catch (final IncorrectResultSizeDataAccessException e) {
	            if (e.getActualSize() == 0) {
	                throw new AccountNotFoundException(username + " not found with SQL query");
	            } else {
	                throw new FailedLoginException("Multiple records found for " + username);
	            }
	        } catch (final DataAccessException e) {
	            throw new PreventedException("SQL exception while executing query for " + username, e);
	        }
	        return createHandlerResult(credential, this.principalFactory.createPrincipal(username), null);
	    }

	    /**
	     * @param sql The sql to set.
	     */
	    public void setSql(final String sql) {
	        this.sql = sql;
	    }
	
}
