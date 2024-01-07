// Code generated by sqlc. DO NOT EDIT.
// versions:
//   sqlc v1.25.0

package db

import (
	"context"
)

type Querier interface {
	CreateUser(ctx context.Context, arg CreateUserParams) (CzUser, error)
	DeleteUser(ctx context.Context, id int64) error
	GetUser(ctx context.Context, id int64) (CzUser, error)
	GetUserForUpdate(ctx context.Context, id int64) (CzUser, error)
	Listusers(ctx context.Context, arg ListusersParams) ([]CzUser, error)
	UpdateUser(ctx context.Context, arg UpdateUserParams) (CzUser, error)
}

var _ Querier = (*Queries)(nil)
