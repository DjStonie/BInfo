package dk.binfo.services;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;

@Service("waitinglist")
public class Waitinglist {
	
	private final JdbcTemplate jdbcTemplate;

    @Autowired
    public Waitinglist(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

	
	public ArrayList<String> getWaitinglist(int length,int ApartmentId){
		return checkPriority(length,getPreferences(length,ApartmentId),ApartmentId);
	}

	public ArrayList<String> getNeighbourEmails(int ApartmentId){
		ArrayList<Integer> neighboursID = new ArrayList<Integer>();
		try {
			PreparedStatement sql = jdbcTemplate.getDataSource().getConnection().prepareStatement("SELECT neighbour FROM `apartment_neighbours` WHERE id_apartment=?;");
			sql.setInt(1, ApartmentId);
			ResultSet result = sql.executeQuery();
			while (result.next()) {
				int neighbour = result.getInt("neighbour");
				neighboursID.add(neighbour);
			}
			sql.close();
			result.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		ArrayList<String> emailsunsorted = new ArrayList<String>();
		for (int neighbourID : neighboursID){
			try {
				PreparedStatement sql = jdbcTemplate.getDataSource().getConnection().prepareStatement("SELECT email FROM `user` WHERE my_apartment=?;");
				sql.setInt(1, neighbourID);
				ResultSet result = sql.executeQuery();
				if (result.next()){
					String email = result.getString("email");
					emailsunsorted.add(email);
				}
				sql.close();
				result.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		ArrayList<String> emailssorted = new ArrayList<String>();
			try {
				String SQLString = "SELECT email FROM `list_and_ancienittet` WHERE email=?";
				for (int i = 1;i>=emailsunsorted.size();i++){
					SQLString += " OR email=?";
				}
				String SQLEND = " AND list_priority=1 ORDER BY seniority ASC;";
				SQLString += SQLEND;
				PreparedStatement sql = jdbcTemplate.getDataSource().getConnection().prepareStatement(SQLString);
				for (int i = 1;i>=emailsunsorted.size();i++){
					sql.setString(i, emailsunsorted.get(i-1));
				}
				ResultSet result = sql.executeQuery();
				while (result.next()){
					String email = result.getString("email");
					emailssorted.add(email);
				}
				sql.close();
				result.close();
				return emailssorted;
			} catch (Exception e){
					e.printStackTrace();
			}
		return null;
	}
	
	public ArrayList<String> getPreferences(int length,int ApartmentId){
		ArrayList<String> pref = new ArrayList<String>();
		try {
				PreparedStatement sql = jdbcTemplate.getDataSource().getConnection().prepareStatement("SELECT email FROM `user_preferences` WHERE id_apartment=?;");
				sql.setInt(1, ApartmentId);
				ResultSet result = sql.executeQuery();
				if(!result.next()){
					sql.close();
					result.close();
					return null;
				}
				
				do {
					String email = result.getString("email");
					pref.add(email);
					if (pref.size() >= length){
						sql.close();
						result.close();
						return pref;
					}
				} while (result.next());
				
				sql.close();
				result.close();
				return pref;
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}
	

	public ArrayList<String> checkPriority(int length,ArrayList<String> emails,int ApartmentId){

				ArrayList<String> emailssorted = getNeighbourEmails(ApartmentId);
				try {
					String SQLString = "SELECT email FROM `list_and_ancienittet` WHERE email=?";
					for (int i = 1;i>=emails.size();i++){
						SQLString += " OR email=?";
					}
					String SQLEND = " AND list_priority=2 ORDER BY seniority ASC;";
					SQLString += SQLEND;
					PreparedStatement sql = jdbcTemplate.getDataSource().getConnection().prepareStatement(SQLString);
					for (int i = 1;i>=emails.size();i++){
						sql.setString(i, emails.get(i-1));
					}
					ResultSet result = sql.executeQuery();
					while (result.next()){
						String email = result.getString("email");
						emailssorted.add(email);
					}
					sql.close();
					result.close();
				} catch (Exception e){
					e.printStackTrace();
				}
		try {
			String SQLString = "SELECT email FROM `list_and_ancienittet` WHERE email=?";
			for (int i = 1;i>=emails.size();i++){
				SQLString += " OR email=?";
			}
			String SQLEND = " AND list_priority=3 ORDER BY seniority ASC;";
			SQLString += SQLEND;
			PreparedStatement sql = jdbcTemplate.getDataSource().getConnection().prepareStatement(SQLString);
			for (int i = 1;i>=emails.size();i++){
				sql.setString(i, emails.get(i-1));
			}
			ResultSet result = sql.executeQuery();
			while (result.next()){
				String email = result.getString("email");
				emailssorted.add(email);
			}
			sql.close();
			result.close();
		} catch (Exception e){
			e.printStackTrace();
		}
		try {
			String SQLString = "SELECT email FROM `list_and_ancienittet` WHERE email=?";
			for (int i = 1;i>=emails.size();i++){
				SQLString += " OR email=?";
			}
			String SQLEND = " AND list_priority=4 ORDER BY seniority ASC;";
			SQLString += SQLEND;
			PreparedStatement sql = jdbcTemplate.getDataSource().getConnection().prepareStatement(SQLString);
			for (int i = 1;i>=emails.size();i++){
				sql.setString(i, emails.get(i-1));
			}
			ResultSet result = sql.executeQuery();
			while (result.next()){
				String email = result.getString("email");
				emailssorted.add(email);
			}
			sql.close();
			result.close();
		} catch (Exception e){
			e.printStackTrace();
		}
		int size = emailssorted.size();
		emailssorted.subList(length, size).clear();
		return emailssorted;
	}

}
