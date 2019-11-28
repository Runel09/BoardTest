package dao.supervisor.face;

import dto.supervisor.Supervisor;

public interface SupervisorDao {

	int selectCntMemberByUseridAndUserpw(Supervisor supervisor);

	Supervisor selectMemberByUserid(Supervisor supervisor);


}
