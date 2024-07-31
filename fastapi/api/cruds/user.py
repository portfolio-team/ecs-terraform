from typing import List, Tuple
from datetime import datetime
from typing import Optional
from sqlalchemy.ext.asyncio import AsyncSession
from sqlalchemy import select
from sqlalchemy.engine import Result

import api.models.task as task_model
import api.models.user as user_model
import api.schemas.user as user_schema
import api.schemas.task as task_schema


async def create_user(
    db: AsyncSession, user_create: user_schema.UserCreate
) -> user_model.User:
    created_at = datetime.now()
    user = user_model.User(**user_create.dict())
    user.created_at = created_at
    db.add(user)
    await db.commit()
    await db.refresh(user)
    return user

## TODO: デバッグ中
async def get_users_with_task_all(db: AsyncSession) -> List[user_schema.User]:
    result: Result = await (
        db.execute(
            select(
                user_model.User.id,
                user_model.User.first_name,
                user_model.User.last_name,
                user_model.User.created_at,
                user_model.User.tasks,
            ).outerjoin(task_model.Task)
        )
    )
    res = result.all()
    print(res)
    return res