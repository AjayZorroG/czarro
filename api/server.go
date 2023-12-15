package api

import (
	"time"

	db "github.com/czarro/db/sqlc"
	ginzap "github.com/gin-contrib/zap"
	"github.com/gin-gonic/gin"
	"go.uber.org/zap"
)

// Server serve HTTP request
type Server struct {
	store  db.Store
	router *gin.Engine
}

var logger *zap.Logger

func NewServer(store db.Store) *Server {
	server := &Server{
		store: store,
	}
	router := gin.Default()
	logger, _ = zap.NewProduction()
	router.Use(ginzap.Ginzap(logger, time.RFC3339, true))
	router.Use(ginzap.RecoveryWithZap(logger, true))
	logger.Info("my name is vikash")
	router.POST("/customers", server.CreateCustomer)
	server.router = router
	return server
}

func (s *Server) Start(address string) error {
	return s.router.Run(address)
}
